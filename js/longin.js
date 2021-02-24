
var memory = window.localStorage || (window.UserDataStorage && new UserDataStorage())||
new cookieStorage();
if(memory.length != 0 && memory.getItem("username") != ""){
	var useName=memory.getItem("username");
	document.getElementById("username").value=useName;
	document.getElementById("remenber").checked=true;
}

function rememberUer(){
	if(document.getElementById("remenber").checked){
	var username= document.getElementById("username").value;
	memory.setItem("username",username);
	}else{
		memory.setItem("username","");
	}
}

function Sub() {
	document.getElementById("sub").setAttribute("type", "submit");
	/*window.open("harita.aspx");*/
    window.location.href = "http://localhost:53547/Harita.aspx";
}