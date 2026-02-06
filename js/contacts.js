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

let currentContactId = null;

function addContact()
{
  document.getElementById("contactAddResult").innerHTML = "";
  
  let firstName = document.getElementById("addFirstName").value;
  let lastName  = document.getElementById("addLastName").value;
  let phone     = document.getElementById("addPhone").value;
  let email     = document.getElementById("addEmail").value;
  
  if (!firstName || !lastName) {
    document.getElementById("contactAddResult").innerHTML = "First name and last name are required.";
    return;
  }
  
  if (!phone && !email) {
    document.getElementById("contactAddResult").innerHTML = "Phone number or email is required.";
    return;
  }
  
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
        loadContacts();
        document.getElementById("addFirstName").value = "";
        document.getElementById("addLastName").value = "";
        document.getElementById("addPhone").value = "";
        document.getElementById("addEmail").value = "";
        closeAddContact();
      }
    };

		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("contactAddResult").innerHTML = err.message;
	}
}

function contactExists(firstName, lastName)
{
  let url = urlBase + '/SearchContact' + extension;
}

function searchContacts()
{
  loadContacts();
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
  row.dataset.firstName = contact.firstName || "";
  row.dataset.lastName = contact.lastName || "";
  row.dataset.email = contact.email || "";
  row.dataset.phone = contact.phone || "";
  
  row.innerHTML = `
    <div class="contact-name">${contact.firstName} ${contact.lastName}</div>
    <div class="contact-email">${contact.email}</div>
    <div class="contact-phone">${contact.phone}</div>
    <button class="more-btn" onclick="openContactMenu(${contact.id})">...</button>
  `;

  list.appendChild(row);
}

function loadContacts()
{
  let jsonPayload = JSON.stringify({
    userId: User.id
  });
  
  let url = urlBase + '/GetContacts' + extension;
  
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
  currentContactId = contactId;
  var menu = document.getElementById("contactMenu");
  menu.classList.remove("hidden");
  var rect = event.target.getBoundingClientRect();
  menu.style.left = rect.left + "px";
  menu.style.top = (rect.bottom + 4) + "px";
}

function openEditContact()
{
  if (currentContactId == null) return;
  var row = document.querySelector('.contact-row[data-id="' + currentContactId + '"]');
  if (!row) return;
  document.getElementById("editFirstName").value = row.dataset.firstName || "";
  document.getElementById("editLastName").value = row.dataset.lastName || "";
  document.getElementById("editEmail").value = row.dataset.email || "";
  document.getElementById("editPhone").value = row.dataset.phone || "";
  document.getElementById("contactMenu").classList.add("hidden");
  document.getElementById("contactEditResult").innerHTML = "";
  document.getElementById("editContactModal").classList.remove("hidden");
}

function closeEditContact()
{
  document.getElementById("editContactModal").classList.add("hidden");
}

function editContact()
{
  if (currentContactId == null) return;
  var firstName = document.getElementById("editFirstName").value.trim();
  var lastName = document.getElementById("editLastName").value.trim();
  var email = document.getElementById("editEmail").value.trim();
  var phone = document.getElementById("editPhone").value.trim();
  var url = urlBase + '/UpdateContact' + extension;
  var jsonPayload = JSON.stringify({
    id: currentContactId,
    userId: User.id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone
  });
  var xhr = new XMLHttpRequest();
  xhr.open("POST", url, true);
  xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        var response = JSON.parse(xhr.responseText);
        if (response.error === "") {
          closeEditContact();
          currentContactId = null;
          loadContacts();
        } else {
          document.getElementById("contactEditResult").innerHTML = response.error;
        }
      } else {
        document.getElementById("contactEditResult").innerHTML = "Failed to update contact.";
      }
    }
  };
  xhr.send(jsonPayload);
}

function deleteContact()
{
  if (currentContactId == null) return;
  var url = urlBase + '/DeleteContact' + extension;
  var jsonPayload = JSON.stringify({ id: currentContactId, userId: User.id });
  var xhr = new XMLHttpRequest();
  xhr.open("POST", url, true);
  xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      document.getElementById("contactMenu").classList.add("hidden");
      currentContactId = null;
      loadContacts();
    }
  };
  xhr.send(jsonPayload);
}

function openAddContact()
{
  document.getElementById("addContactModal").classList.remove("hidden");
  document.getElementById("contactAddResult").innerHTML = "";
}

function closeAddContact()
{
  document.getElementById("addContactModal").classList.add("hidden");
}

function openUserMenu()
{
  var menu = document.getElementById("userMenu");
  menu.classList.toggle("hidden");
  if (!menu.classList.contains("hidden")) {
    var btn = document.querySelector(".icon-btn[onclick='openUserMenu()']");
    if (btn) {
      var rect = btn.getBoundingClientRect();
      menu.style.left = rect.left + "px";
      menu.style.top = (rect.bottom + 4) + "px";
    }
  }
}


window.onload = function ()
{
  readCookie();
  exitIfLoggedOut();
  loadContacts();
};

