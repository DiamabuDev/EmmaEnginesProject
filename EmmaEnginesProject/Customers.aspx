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
<body>
    <form id="form1" runat="server">
        <p>
            <br />
        </p>
        <asp:Label ID="Label3" runat="server" Text="Search Customer"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
        <p>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="Clear_Click" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:ListBox ID="lstResults" runat="server" Height="258px" Width="378px" AutoPostBack="True" OnSelectedIndexChanged="Result_Selected"></asp:ListBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:FormView ID="fvCustomer" runat="server" DataKeyNames="id" DataSourceID="odsCustomers">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    custFirst:
                    <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
                    <br />
                    custLast:
                    <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
                    <br />
                    custPhone:
                    <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
                    <br />
                    custAddress:
                    <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
                    <br />
                    custCity:
                    <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
                    <br />
                    custPostal:
                    <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
                    <br />
                    custEmail:
                    <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    custFirst:
                    <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
                    <br />
                    custLast:
                    <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
                    <br />
                    custPhone:
                    <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
                    <br />
                    custAddress:
                    <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
                    <br />
                    custCity:
                    <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
                    <br />
                    custPostal:
                    <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
                    <br />
                    custEmail:
                    <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    custFirst:
                    <asp:Label ID="custFirstLabel" runat="server" Text='<%# Bind("custFirst") %>' />
                    <br />
                    custLast:
                    <asp:Label ID="custLastLabel" runat="server" Text='<%# Bind("custLast") %>' />
                    <br />
                    custPhone:
                    <asp:Label ID="custPhoneLabel" runat="server" Text='<%# Bind("custPhone") %>' />
                    <br />
                    custAddress:
                    <asp:Label ID="custAddressLabel" runat="server" Text='<%# Bind("custAddress") %>' />
                    <br />
                    custCity:
                    <asp:Label ID="custCityLabel" runat="server" Text='<%# Bind("custCity") %>' />
                    <br />
                    custPostal:
                    <asp:Label ID="custPostalLabel" runat="server" Text='<%# Bind("custPostal") %>' />
                    <br />
                    custEmail:
                    <asp:Label ID="custEmailLabel" runat="server" Text='<%# Bind("custEmail") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </p>
        <p>
            <asp:ObjectDataSource ID="odsCustomers" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaEnginesLibrary.EmmasDataSetTableAdapters.customerUpdate" UpdateMethod="Update">
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
                <SelectParameters>
                    <asp:SessionParameter Name="Param1" SessionField="CustomerID" Type="Int32" />
                </SelectParameters>
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
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
