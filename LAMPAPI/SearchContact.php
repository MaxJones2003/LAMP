<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Read JSON input
$inData = getRequestInfo();

// Extract inputs safely
$search = $inData["search"] ?? "";
$userId = $inData["userId"] ?? 0;

// Add SQL wildcards for LIKE search
$search = "%" . $search . "%";

// Connect to database
$conn = new mysqli("localhost", "TheBeast", "WeLoveCOP4331", "COP4331");
if ($conn->connect_error)
{
    returnWithError($conn->connect_error);
    exit();
}

// Prepare SQL
$stmt = $conn->prepare(
    "SELECT ID, FirstName, LastName, Phone, Email
     FROM Contacts
     WHERE UserID = ?
     AND (
         FirstName LIKE ?
         OR LastName LIKE ?
         OR CONCAT(FirstName, ' ', LastName) LIKE ?
     )
     ORDER BY LastName, FirstName"
);

$stmt->bind_param("isss", $userId, $search, $search, $search);
$stmt->execute();

$result = $stmt->get_result();

$results = [];

// Fetch rows (same shape as GetContacts for frontend)
while ($row = $result->fetch_assoc())
{
    $results[] = [
        "ID"        => (int)$row["ID"],
        "FirstName" => $row["FirstName"],
        "LastName"  => $row["LastName"],
        "Email"     => $row["Email"],
        "Phone"     => $row["Phone"]
    ];
}

$stmt->close();
$conn->close();

// Return response (always results array; empty when no matches)
returnWithInfo($results);

// ----------------- Helper Functions -----------------

function getRequestInfo()
{
    return json_decode(file_get_contents("php://input"), true);
}

function sendResultInfoAsJson($obj)
{
    header("Content-Type: application/json");
    echo json_encode($obj);
}

function returnWithError($err)
{
    sendResultInfoAsJson([
        "results" => [],
        "error" => $err
    ]);
}

function returnWithInfo($results)
{
    sendResultInfoAsJson([
        "results" => $results,
        "error" => ""
    ]);
}
?>
