<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="EmmaEnginesProject.CreateOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Order</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/create-order.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Create New Order</h1>
            <div class="form-group">
                <label>Order Number:</label>
                <asp:Label ID="lblOrderNumber" runat="server" ReadOnly="true"></asp:Label>
            </div>
            <div class="form-group">
                <label>Order Date:</label>
                <asp:Label ID="lblOrderDate" runat="server" ReadOnly="true"></asp:Label>
            </div>
            <div class="form-group">
                <label>Employee Name:</label>
                <asp:Label ID="lblEmployeeName" runat="server" ReadOnly="true"></asp:Label>
            </div>
            <div class="form-group">
                <label>Customer Name:</label>
                <asp:Label ID="lblCustName" runat="server" ReadOnly="true"></asp:Label>
            </div>
            <div class="form-group horizontal">
                <label>Order Paid:</label>
                <asp:CheckBox ID="chkOrderPaid" runat="server" />
            </div>
            <div class="form-group horizontal">
                <label>Payment Method:</label>
                <asp:DropDownList ID="ddlPaymentMethod" runat="server"></asp:DropDownList>
            </div>
            <div class="product-section">
                <h2>Add Products</h2>
                <div class="product-line">
                    <div class="form-group horizontal">
                        <label>Product:</label>
                        <asp:DropDownList ID="ddlProducts" runat="server" CssClass="product-dropdown"></asp:DropDownList>  
                    </div>
                    <div class="form-group quantity-controls">
                        <label>Quantity:</label>
                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="quantity-button" OnClick="btnDecrease_Click" />
                        <asp:Label ID="lblQuantity" runat="server" Text="0"></asp:Label>
                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="quantity-button" OnClick="btnIncrease_Click" />
                    </div>
                </div>                
                <div class="button-container">
                    <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="button" />
                </div>
                <div class="button-container">
                    <asp:Button ID="btnCreateOrder" runat="server" Text="Create Order" OnClick="btnCreateOrder_Click" CssClass="button" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
