<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="EmmaEnginesProject.Orders" %>

<!DOCTYPE html>

<head runat="server">
    <title>Orders</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/customers.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <div class="navbar-icon">
                <img src="Assets/logo.png" alt="Icon" />
            </div>
            <div class="navbar-links">
                <a href="/Home.aspx" class="nav-link">Home</a>
                <a href="/Orders.aspx" class="nav-link">Orders</a>
                <a href="/Customers.aspx" class="nav-link">Customers</a>
                <a href="#" class="nav-link">Employees</a>
            </div>
            <div class="navbar-signout">
                <asp:LinkButton ID="lnkSignOut" runat="server" OnClick="SignOut_Click" CssClass="sign-out">Sign out</asp:LinkButton>
            </div>          
        </nav>
        <div class="container">
            <asp:Label ID="lblHeading" runat="server" Text="All Orders" CssClass="heading"></asp:Label>
            <asp:Button ID="btnNewOrder" runat="server" Text="New Order" CssClass="button" />
            <div class="button-container">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="SearchOrder_Click" />
            </div>
            <br />
            <br />
        </div>
    </form>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
</body>
</html>
