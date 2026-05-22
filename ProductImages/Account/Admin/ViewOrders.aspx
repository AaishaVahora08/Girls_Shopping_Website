<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="Admin_ViewOrders" %>

<form id="Form1" runat="server">
<h2>All Orders</h2>

<asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
        <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
        <asp:BoundField DataField="TotalAmount" HeaderText="Amount" />
        <asp:BoundField DataField="Status" HeaderText="Status" />

        <asp:HyperLinkField 
            Text="View"
            DataNavigateUrlFields="OrderID"
            DataNavigateUrlFormatString="OrderDetails.aspx?oid={0}" />
    </Columns>
</asp:GridView>
</form>
