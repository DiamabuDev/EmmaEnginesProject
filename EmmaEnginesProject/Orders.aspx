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
        <div class="container">
            <asp:Label ID="lblHeading" runat="server" Text="All Orders" CssClass="heading"></asp:Label>
            <asp:Button ID="btnNewOrder" runat="server" Text="New Order" CssClass="button" />
            
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id" CssClass="gridView" DataSourceID="odsOrders">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ordNumber" HeaderText="ordNumber" SortExpression="ordNumber" />
                    <asp:BoundField DataField="ordDate" HeaderText="ordDate" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="ordPaid" SortExpression="ordPaid" />
                    <asp:BoundField DataField="paymentID" HeaderText="paymentID" SortExpression="paymentID" />
                    <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" />
                    <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
                </Columns>
            </asp:GridView>

            <asp:ObjectDataSource ID="odsOrders" runat="server" 
                TypeName="EmmaLibrary.EmmasDatasetTableAdapters.orderTableAdapter" 
                SelectMethod="GetData" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ordNumber" Type="String" />
                    <asp:Parameter Name="ordDate" Type="DateTime" />
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="paymentID" Type="Int32" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="empID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ordNumber" Type="String" />
                    <asp:Parameter Name="ordDate" Type="DateTime" />
                    <asp:Parameter Name="ordPaid" Type="Boolean" />
                    <asp:Parameter Name="paymentID" Type="Int32" />
                    <asp:Parameter Name="custID" Type="Int32" />
                    <asp:Parameter Name="empID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
</body>
</html>
