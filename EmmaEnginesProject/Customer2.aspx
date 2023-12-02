<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer2.aspx.cs" Inherits="EmmaEnginesProject.Customer2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvCity" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="custFirst" HeaderText="custFirst" SortExpression="custFirst" />
                    <asp:BoundField DataField="custLast" HeaderText="custLast" SortExpression="custLast" />
                    <asp:BoundField DataField="custPhone" HeaderText="custPhone" SortExpression="custPhone" />
                    <asp:BoundField DataField="custAddress" HeaderText="custAddress" SortExpression="custAddress" />
                    <asp:BoundField DataField="custCity" HeaderText="custCity" SortExpression="custCity" />
                    <asp:BoundField DataField="custPostal" HeaderText="custPostal" SortExpression="custPostal" />
                    <asp:BoundField DataField="custEmail" HeaderText="custEmail" SortExpression="custEmail" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            <br />
            <br />
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaEnginesLibrary.EmmasDataSetTableAdapters.customerByCityTableAdapter" UpdateMethod="Update">
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
                    <asp:ControlParameter ControlID="txtCity" Name="Param1" PropertyName="Text" Type="String" />
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
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"></asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
