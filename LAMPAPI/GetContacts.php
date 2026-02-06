<?php

	$inData = getRequestInfo();

	$userId = $inData["userId"] ?? 0;

	$conn = new mysqli("localhost", "TheBeast", "WeLoveCOP4331", "COP4331");
	if ($conn->connect_error)
	{
		returnWithError($conn->connect_error);
	}
	else
	{
		$stmt = $conn->prepare(
			"SELECT ID, FirstName, LastName, Email, Phone FROM Contacts WHERE UserID = ? ORDER BY LastName, FirstName"
		);
		$stmt->bind_param("i", $userId);
		$stmt->execute();
		$result = $stmt->get_result();

		$results = array();
		while ($row = $result->fetch_assoc())
		{
			$results[] = array(
				"ID"        => (int)$row["ID"],
				"FirstName" => $row["FirstName"],
				"LastName"  => $row["LastName"],
				"Email"     => $row["Email"],
				"Phone"     => $row["Phone"]
			);
		}

		$stmt->close();
		$conn->close();
		returnWithResults($results);
	}

	function getRequestInfo()
	{
		return json_decode(file_get_contents('php://input'), true);
	}

	function sendResultInfoAsJson($obj)
	{
		header('Content-type: application/json');
		echo $obj;
	}

	function returnWithError($err)
	{
		$retValue = '{"results":[],"error":"' . $err . '"}';
		sendResultInfoAsJson($retValue);
	}

	function returnWithResults($results)
	{
		$retValue = '{"results":' . json_encode($results) . ',"error":""}';
		sendResultInfoAsJson($retValue);
	}

?>
