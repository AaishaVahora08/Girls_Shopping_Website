<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="EditProduct.aspx.cs"
    Inherits="Admin_EditProduct" %>

<form id="form1" runat="server">

    Product Name:<br />
    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
    <br /><br />

    Price:<br />
    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
    <br /><br />

    <tr>
    <td>Product Image</td>
    <td>
        <asp:FileUpload ID="ImageName" runat="server" />
    <br />
    <br /><br />

    <asp:Button ID="btnUpdate"
        runat="server"
        Text="Update Product"
        OnClick="btnUpdate_Click" />

</form>
