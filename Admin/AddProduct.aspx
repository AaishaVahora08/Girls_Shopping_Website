<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="Admin_AddProduct" %>

<form id="form1" runat="server">

<table>
<tr>
<td>Category</td>
<td>
<asp:DropDownList ID="ddlCategory" runat="server"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
</asp:DropDownList>
</td>
</tr>

<tr>
<td>Sub Category</td>
<td>
<asp:DropDownList ID="ddlSubCategory" runat="server"></asp:DropDownList>
</td>
</tr>

<tr>
<td>Product Name</td>
<td><asp:TextBox ID="txtProductName" runat="server"></asp:TextBox></td>
</tr>

<tr>
<td>Price</td>
<td><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
</tr>

<tr>
<td>Stock</td>
<td><asp:TextBox ID="txtStock" runat="server"></asp:TextBox></td>
</tr>

<tr>
<td>Image</td>
<td><asp:FileUpload ID="fuImage" runat="server" /></td>
</tr>

<tr>
<td></td>
<td>
<asp:Button ID="btnAddProduct" runat="server"
    Text="Add Product"
    OnClick="btnAddProduct_Click" />

    <br />

    <br />
<asp:Button ID="btnAddProduct0" runat="server"
    Text="View product"
    OnClick="btnAddProduct_Click" PostBackUrl="~/Admin/ViewProduct.aspx" />

</td>
</tr>

</table>

</form>