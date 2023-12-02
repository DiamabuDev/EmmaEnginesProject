<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCustomer.aspx.cs" Inherits="EmmaEnginesProject.CreateCustomer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Customer</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/create-customer.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="heading">Create New Customer</h1>
            
            <div class="form-field">
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-text"></asp:TextBox>
            </div>

            <div class="form-field">
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-text"></asp:TextBox>
            </div>

            <div class="form-field">
                <label for="txtPhoneNumber">Phone Number</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="input-text"></asp:TextBox>
            </div>

            <div class="form-field">
                <label for="txtAddress">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="input-text"></asp:TextBox>
            </div>

            <div class="form-field">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-text"></asp:TextBox>
            </div>           
            <div class="button-container">
                <asp:Button ID="btnCreateCustomer" runat="server" Text="Create Customer" CssClass="button" OnClick="CreateCustomer_Click" />
            </div>
        </div>
    </form>
</body>
</html>
