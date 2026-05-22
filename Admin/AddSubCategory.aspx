<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="Admin_AddSubCategory" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Sub Category</title>
</head>
<body>

<h2>Add Sub Category</h2>

<form id="form1" runat="server">

    Category :
    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
    <br /><br />

    Sub Category Name :
    <asp:TextBox ID="txtSubCategory" runat="server"></asp:TextBox>
    <br /><br />

    Status :
    <asp:DropDownList ID="ddlStatus" runat="server">
        <asp:ListItem>Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:DropDownList>
    <br /><br />

    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
      <br /><br />
    
    <asp:Button ID="Button1" runat="server" Text="View SubCategory" 
        OnClick="btnSave_Click" PostBackUrl="~/Admin/ViewSubCategory.aspx" />
      <br /><br />
</form>

</body>
</html>
