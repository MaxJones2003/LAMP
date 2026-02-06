const urlBase = 'https://group4contactlist.me/LAMPAPI';
const extension = '.php';

let User = {
  id : 0,
  firstName : "",
  lastName : ""
}

function doLogout()
{
	User.id = 0;
	User.firstName = "";
	User.lastName = "";
	document.cookie = "firstName= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
	window.location.href = "/";
}

function addContact()
{
  document.getElementById("contactAddResult").innerHTML = "";
  
  let firstName = document.getElementById("firstName").value;
  let lastName  = document.getElementById("lastName").value;
  let phone     = document.getElementById("phoneNumber").value;
  let email     = document.getElementById("email").value;
  
  let jsonPayload = JSON.stringify({
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      userId: User.id
  });


	let url = urlBase + '/AddContact' + extension;
	
	let xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
    {
      if (this.readyState == 4 && this.status == 200) 
      {
        document.getElementById("contactAddResult").innerHTML = "Contact has been added";
        
        // Reload list so the new contact appears
        loadContacts();
        
        // Optional: clear form fields
        document.getElementById("firstName").value = "";
        document.getElementById("lastName").value = "";
        document.getElementById("phoneNumber").value = "";
        document.getElementById("email").value = "";
      }
    };

		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("contactAddResult").innerHTML = err.message;
	}
	
}

function searchContact()
{
	let search = document.getElementById("searchText").value;
	document.getElementById("contactSearchResult").innerHTML = "";
	
	let colorList = "";

	let jsonPayload = JSON.stringify({search:search, userId:User.id});

	let url = urlBase + '/SearchContact' + extension;
	
	let xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{
			if (this.readyState == 4 && this.status == 200) 
			{
				document.getElementById("contactSearchResult").innerHTML = "Contact(s) has been retrieved";
        console.log(xhr.responseText);
				let jsonObject = JSON.parse( xhr.responseText );
				
				for( let i=0; i<jsonObject.results.length; i++ )
				{
					colorList += jsonObject.results[i];
					if( i < jsonObject.results.length - 1 )
					{
						colorList += "<br />\r\n";
					}
				}
				
				document.getElementsByTagName("p")[0].innerHTML = colorList;
			}
		};
		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("contactSearchResult").innerHTML = err.message;
	}
	
}

function addContactToList(contact)
{
  const list = document.getElementById("contactList");
  
  const row = document.createElement("div");
  row.className = "contact-row";
  row.dataset.id = contact.id;
  
  row.innerHTML = `
    <div class="contact-name">${contact.firstName} ${contact.lastName}</div>
    <div class="contact-email">${contact.email}</div>
    <div class="contact-phone">${contact.phone}</div>
    <button class="contact-menu-btn" onclick="openContactMenu(${contact.id})">?</button>
    `;

  list.appendChild(row);
}

function loadContacts()
{
  let jsonPayload = JSON.stringify({
    search: "",
    userId: User.id
  });
  
  let url = urlBase + '/SearchContact' + extension;
  
  let xhr = new XMLHttpRequest();
  xhr.open("POST", url, true);
  xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
  
  xhr.onreadystatechange = function ()
  {
    if (xhr.readyState === 4 && xhr.status === 200)
    {
      let response = JSON.parse(xhr.responseText);
      
      const list = document.getElementById("contactList");
      list.innerHTML = ""; // clear existing list
      
      if (!response.results || response.results.length === 0)
      {
        list.innerHTML = "<p>No contacts found</p>";
        return;
      }
      
      for (let c of response.results)
      {
        addContactToList({
          id: c.ID,
          firstName: c.FirstName,
          lastName: c.LastName,
          email: c.Email,
          phone: c.Phone
        });
      }
    }
  };
  
  xhr.send(jsonPayload);
}



function readCookie()
{
	User.id = -1;
	let data = document.cookie;
	let splits = data.split(",");
	for(var i = 0; i < splits.length; i++) 
	{
		let thisOne = splits[i].trim();
		let tokens = thisOne.split("=");
		if( tokens[0] == "firstName" )
		{
			User.firstName = tokens[1];
		}
		else if( tokens[0] == "lastName" )
		{
			User.lastName = tokens[1];
		}
		else if( tokens[0] == "userId" )
		{
			User.id = parseInt( tokens[1].trim() );
		}
	}
	
	if( User.id < 0 )
	{
		window.location.href = "/";
	}
	else
	{
    //document.getElementById("userName").innerHTML = "Logged in as " + firstName + " " + lastName;
	}
}

function exitIfLoggedOut()
{
  if (!User || User.id < 1) {
    window.location.href = "index.html"; // not logged in
  }
}

function openContactMenu(contactId)
{
  console.log("Open menu for contact:", contactId);
  // TODO: show edit/delete popup
}

function editContact(contactId)
{
  console.log("Edit contact:", contactId);
  // TODO: open edit modal
}

function deleteContact(contactId)
{
  console.log("Delete contact:", contactId);
  // TODO: call DeleteContact API + remove from UI
}

function openAddContactModal()
{
  console.log("Open add contact modal");
}

function closeAddContactModal()
{
  console.log("Close add contact modal");
}


window.onload = function ()
{
  readCookie();
  exitIfLoggedOut();
  loadContacts();
};

