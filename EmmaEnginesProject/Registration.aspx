<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EmmaEnginesProject.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/login.css" rel="stylesheet" type="text/css" />
</head>
<body>    
    <div class="flex-container">
        <div class="column column-right">
            <img alt="a mechanical working on a lawn-mower" src="Assets/login-img.png" />
        </div>
        <div class="column column-left">
            <div class="container">
                <h1>Emma's Small Engines</h1>
                <form id="formRegister" runat="server" class="form-container">
                    <label class="label">Register Here</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text" placeholder="User"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Please enter a valid user"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-text" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a valid password"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtConfirm" runat="server" CssClass="input-text" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <asp:Label runat="server" ID="lblMessage" class="message"></asp:Label>                    
                    <asp:Button runat="server" CssClass="button" Text="Register" ID="btnRegister" OnClick="Register_Click" />
                    <asp:LinkButton ID="lnkSignIn" runat="server" CssClass="btnLink" CausesValidation="False" OnClick="SignIn_Click">Log in</asp:LinkButton>
                </form>
            </div>        
        </div>        
    </div>    
</body>
</html>
