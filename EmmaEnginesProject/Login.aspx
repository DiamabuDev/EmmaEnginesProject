<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmmaEnginesProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/login.css" rel="stylesheet" type="text/css" />
</head>
<body>    
    <div class="flex-container">
        <div class="column column-left">
            <div class="container">
                <h1>Emma's Small Engines</h1>
                <form id="form1" runat="server" class="form-container">
                    <label class="label">Login</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text" placeholder="User"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Please enter a valid user"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-text" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a valid password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblMessage" runat="server" class="label"></asp:Label>
                    <asp:Button ID="btnSignIn" runat="server" CssClass="button" Text="Sign in" OnClick="SignIn_Click"/>
                    <asp:LinkButton ID="lnkRegister" runat="server" CssClass="btnLink" CausesValidation="False" OnClick="Register_Click">Register</asp:LinkButton>
                </form>
            </div>        
        </div>
        <div class="column column-right">
            <img alt="a mechanical working on a lawn-mower" src="Assets/login-img.png" />
        </div>
    </div>    
</body>
</html>
