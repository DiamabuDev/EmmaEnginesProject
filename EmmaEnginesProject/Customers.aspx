<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="EmmaEnginesProject.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet" />
    <link href="Styles/customers.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
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
            <asp:Label ID="lblHello" runat="server" Text="Hello, " CssClass="label-hello"></asp:Label>
            <asp:Label ID="lblHeading" runat="server" Text="All Customers" CssClass="heading"></asp:Label>
            <asp:Button ID="btnNewCustomer" runat="server" Text="New Customer" CssClass="button" />
            <div class="button-container">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="SearchCustomer_Click" />
            </div>
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="label-hello"></asp:Label>
            
            <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id" CssClass="gridView" OnRowEditing="gvCustomers_RowEditing" 
                OnRowUpdating="gvCustomers_RowUpdating" OnRowCancelingEdit="gvCustomers_RowCancelingEdit">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CommandArgument='<%# Eval("id") %>' OnClick="lnkSelect_Click" CssClass="btn-select">
                                <i class="fas fa-hand-pointer"></i> 
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name" SortExpression="custFirst">
                        <ItemTemplate>
                            <%# Eval("custFirst") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustFirst" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name" SortExpression="custLast">
                        <ItemTemplate>
                            <%# Eval("custLast") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustLast" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="custPhone">
                        <ItemTemplate>
                            <%# Eval("custPhone") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustPhone" runat="server" Text='<%# Bind("custPhone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="custAddress">
                        <ItemTemplate>
                            <%# Eval("custAddress") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustAddress" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City" SortExpression="custCity">
                        <ItemTemplate>
                            <%# Eval("custCity") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustCity" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Postal Code" SortExpression="custPostal">
                        <ItemTemplate>
                            <%# Eval("custPostal") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustPostal" runat="server" Text='<%# Bind("custPostal") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="custEmail">
                        <ItemTemplate>
                            <%# Eval("custEmail") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCustEmail" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn-update">
                                <i class="fas fa-check"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn-cancel">
                                <i class="fas fa-times"></i>
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("id") %>' CssClass="btn-edit">
                                <i class="fas fa-edit"></i> 
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsCustomers" runat="server" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaLibrary.EmmasDatasetTableAdapters.customerTableAdapter">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="custFirst" Type="String" />
                    <asp:Parameter Name="custLast" Type="String" />
                    <asp:Parameter Name="custPhone" Type="String" />
                    <asp:Parameter Name="custAddress" Type="String" />
                    <asp:Parameter Name="custCity" Type="String" />
                    <asp:Parameter Name="custPostal" Type="String" />
                    <asp:Parameter Name="custEmail" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="custFirst" Type="String" />
                    <asp:Parameter Name="custLast" Type="String" />
                    <asp:Parameter Name="custPhone" Type="String" />
                    <asp:Parameter Name="custAddress" Type="String" />
                    <asp:Parameter Name="custCity" Type="String" />
                    <asp:Parameter Name="custPostal" Type="String" />
                    <asp:Parameter Name="custEmail" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <br />
        </div>
    </form>
</body>
</html>
