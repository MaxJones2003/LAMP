<?php
  $inData = getRequestInfo();
  
  $conn = new mysqli("localhost", "TheBeast", "WeLoveCOP4331", "COP4331");
  if ($conn->connect_error)
  {
    returnWithError($conn->connect_error);
  }
  else
  {
    // verify account doesnt exist
    $stmt = $conn->prepare("SELECT ID FROM Users WHERE Login=?");
    $stmt->bind_param("s", $inData["login"]);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->fetch_assoc())
    {
      returnWithError("User: " . $inData["login"]. " , already exists.");
      $stmt->close();
      $conn->close();
      return;
    }
    
    $stmt->close();
    
    $stmt = $conn->prepare("INSERT INTO Users (FirstName, LastName, Login, Password) VALUES (?, ?, ?, ?)");
    
    $stmt->bind_param(
            "ssss",
            $inData["firstName"],
            $inData["lastName"],
            $inData["login"],
            $inData["password"]
        );
    
    if ($stmt->execute())
    {
      $id = $stmt->insert_id;
      returnWithInfo(
        $inData["firstName"], 
        $inData["lastName"], 
        $inData["login"], 
        $id
      );

    }
    else
    {
      returnWithError("Failed to register user");
    }
    
    $stmt->close();
    $conn->close();
  }
  
  function getRequestInfo()
  {
    return json_decode(file_get_contents('php://input'), true);
  }
  
  function sendResultInfoAsJSON($obj)
  {
    header('Content-type: application/json');
    echo $obj;
  }

  
  function returnWithError($err)
  {
    $retValue = '{"id":0,"firstName":"","lastName":"", "login":"","error":"' . $err . '"}';
    sendResultInfoAsJSON($retValue);
  }
  
  function returnWithInfo($firstName, $lastName, $login, $id)
  {
    $retValue = '{"id":' . $id .
      ',"firstName":"' . $firstName .
      '","lastName":"' . $lastName .
      '","login":"' . $login .
      '","error":""}';
    sendResultInfoAsJSON($retValue);
  }

?>