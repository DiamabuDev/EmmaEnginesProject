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
    <style type="text/css">
        .auto-style2 {
            width: 127px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <br />
        </p>
        <asp:Label ID="Label3" runat="server" Text="Search Employee"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
        <p>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Position"></asp:Label>
        </p>
        <p>
            <asp:DropDownList ID="ddlPosition" runat="server" Height="17px" Width="207px">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearchClick" Text="Search" />
            <asp:Button ID="btnClear" runat="server" OnClick="Clear_Click" Text="Clear" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:ListBox ID="lstResults" runat="server" AutoPostBack="True" Height="258px" OnSelectedIndexChanged="Result_Selected" Width="378px"></asp:ListBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:FormView ID="fvEmployee" runat="server" DataKeyNames="id" DataSourceID="odsEmployees">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    empFirst:
                    <asp:TextBox ID="empFirstTextBox" runat="server" Text='<%# Bind("empFirst") %>' />
                    <br />
                    empLast:
                    <asp:TextBox ID="empLastTextBox" runat="server" Text='<%# Bind("empLast") %>' />
                    <br />
                    posID:
                    <asp:TextBox ID="posIDTextBox" runat="server" Text='<%# Bind("posID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    empFirst:
                    <asp:TextBox ID="empFirstTextBox" runat="server" Text='<%# Bind("empFirst") %>' />
                    <br />
                    empLast:
                    <asp:TextBox ID="empLastTextBox" runat="server" Text='<%# Bind("empLast") %>' />
                    <br />
                    posID:
                    <asp:TextBox ID="posIDTextBox" runat="server" Text='<%# Bind("posID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    empFirst:
                    <asp:Label ID="empFirstLabel" runat="server" Text='<%# Bind("empFirst") %>' />
                    <br />
                    empLast:
                    <asp:Label ID="empLastLabel" runat="server" Text='<%# Bind("empLast") %>' />
                    <br />
                    posID:
                    <asp:Label ID="posIDLabel" runat="server" Text='<%# Bind("posID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" 
                        CommandName="Delete" 
                        Text="Delete" CausesValidation="False" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </p>
        <p>
            <asp:ObjectDataSource ID="odsPosition" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaEnginesLibrary.EmmasDataSetTableAdapters.positionTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_posName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="posName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="posName" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_posName" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsEmployees" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaEnginesLibrary.EmmasDataSetTableAdapters.employeeUpdate" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="empFirst" Type="String" />
                    <asp:Parameter Name="empLast" Type="String" />
                    <asp:Parameter Name="posID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Param1" SessionField="EmployeeID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="empFirst" Type="String" />
                    <asp:Parameter Name="empLast" Type="String" />
                    <asp:Parameter Name="posID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
