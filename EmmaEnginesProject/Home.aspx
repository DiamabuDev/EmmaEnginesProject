<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EmmaEnginesProject.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <asp:PlaceHolder runat="server"> 
    </asp:PlaceHolder>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/home.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="form-container">
    <nav class="navbar">
            <div class="navbar-icon">
                <img src="Assets/logo.png" alt="Icon" />
            </div>
            <div class="navbar-links">
                <a href="#" class="nav-link">Home</a>
                <a href="#" class="nav-link">About</a>
                <a href="#" class="nav-link">Orders</a>
                <a href="#" class="nav-link">Customers</a>
                <a href="#" class="nav-link">Employees</a>
                <a href="#" class="nav-link">Contact</a>
            </div>
            <div class="navbar-signout">
                <asp:LinkButton ID="lnkSignOut" runat="server" OnClick="SignOut_Click" CssClass="sign-out">Sign out</asp:LinkButton>
            </div>          
    </nav>
    </form>
</body>
</html>
