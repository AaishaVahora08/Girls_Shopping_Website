<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="Admin_OrderDetails" %>

<form id="Form1" runat="server">
<h2>Order Details</h2>

<asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="True"></asp:GridView>

<br />

Order Status:
<asp:DropDownList ID="ddlStatus" runat="server">
    <asp:ListItem>Pending</asp:ListItem>
    <asp:ListItem>Approved</asp:ListItem>
    <asp:ListItem>Shipped</asp:ListItem>
    <asp:ListItem>Delivered</asp:ListItem>
</asp:DropDownList>

<br /><br />
<asp:Button ID="btnUpdate" runat="server" Text="Update Status" OnClick="btnUpdate_Click" />
</form>
