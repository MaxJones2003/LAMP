<?php

	$inData = getRequestInfo();

	$conn = new mysqli("localhost", "TheBeast", "WeLoveCOP4331", "COP4331");
	if ($conn->connect_error) 
	{
		returnWithError( $conn->connect_error );
	} 
	else
	{
		$stmt = $conn->prepare(
			"UPDATE Contacts
			 SET FirstName = ?, LastName = ?, Email = ?, Phone = ?
			 WHERE ID = ? AND UserID = ?"
		);
		$stmt->bind_param(
			"ssssii",
			$inData["firstName"],
			$inData["lastName"],
			$inData["email"],
			$inData["phone"],
			$inData["id"],
			$inData["userId"]
		);
		$stmt->execute();	
		$stmt->close();
		$conn->close();
		returnNoError();
	}

	function getRequestInfo()
	{
		return json_decode(file_get_contents('php://input'), true);
	}

	function sendResultInfoAsJson( $obj )
	{
		header('Content-type: application/json');
		echo $obj;
	}
	
	function returnWithError( $err )
	{
		$retValue = '{"error":"' . $err . '"}';
		sendResultInfoAsJson( $retValue );
	}
	
	function returnNoError()
	{
		$retValue = '{"error":""}';
		sendResultInfoAsJson($retValue);
	}	
	
?>
