<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OpenlayersMap.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
</head>
<body>
    	<div class="login">
		<div class="message">Kullanıcı Girişi</div>	
		<div id="dackimge"><img src="img/backform.png"/></div>
			<form id="form1" runat="server">
				<input name="action" value="login" type="hidden"/>
				<img src="img/user.png" class="usimg"/>
                <asp:TextBox ID="username" placeholder="Kullanıcı adınızı giriniz.." runat="server"></asp:TextBox>
	
				<hr class="hr15"/>
				<img src="img/password.png" class="usimg"/>
                <asp:TextBox ID="password" runat="server" placeholder="Şifre Giriniz.." TextMode="Password" OnTextChanged="password_TextChanged"></asp:TextBox>
			<hr class="hr15"/>
			<div id="reme">
                <asp:CheckBox ID="remenber" title="Beni Hatırla" class="remenber" runat="server" /><span>Beni Hatırla</span>
    </div>
			<hr class="hr15"/>
                <asp:Button ID="Button1" runat="server" style="width: 100%;"  Text="Giriş" OnClick="Button1_Click" />

			<hr class="hr20"/>
                <asp:Label ID="Label1" runat="server"></asp:Label>
			</form>			
		</div>
		<div class="foot"><span>Kullanıcı Girişi</span></div>
		<script src="js/longin.js"></script>
</body>
</html>
