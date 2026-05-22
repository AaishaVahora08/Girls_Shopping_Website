<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Customer_Bill" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>Invoice</title>

<style>
body{
    background:#f5f5f5;
    font-family:Arial;
}
.invoice{
    width:800px;
    margin:30px auto;
    background:white;
    padding:30px;
    box-shadow:0 0 10px #ccc;
}
.header{
    text-align:center;
    color:#e91e63;
}
table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}
th, td{
    border:1px solid #ddd;
    padding:10px;
    text-align:center;
}
th{
    background:#f2f2f2;
}
.total{
    text-align:right;
    font-size:18px;
    font-weight:bold;
    margin-top:15px;
}
/* PRINT PDF*/
@media print
{
    body *
    {
        visibility:hidden;
    }
    #invoiceArea, #invoiceArea *
    {
        visibility:visible;
    }
    #invoiceArea
    {
        position:inherit;
        left:0;
        top:0;
        width:100%;
    }
    button, input 
    {
        display:none;
    }
}
</style>
<script>    function downloadPDF() {
        window: print();
    }
</script>
</head>

<body>
<form id="Form1" runat="server">
<div class="invoice">

<h2 class="header">Girls Shopping - Invoice</h2>

<p>
<b>Order ID:</b> <asp:Label ID="lblOrderID" runat="server"></asp:Label> <br />
<b>Date:</b> <asp:Label ID="lblDate" runat="server"></asp:Label>
</p>

<asp:GridView ID="gvBill" runat="server" AutoGenerateColumns="false">
<Columns>
    <asp:BoundField DataField="ProductName" HeaderText="Product"/>
    <asp:BoundField DataField="Quantity" HeaderText="Qty"/>
    <asp:BoundField DataField="Price" HeaderText="Price"/>
    <asp:BoundField DataField="Total" HeaderText="Total"/>
</Columns>
</asp:GridView>

<div class="total">
Grand Total: ₹ <asp:Label ID="lblTotal" runat="server"></asp:Label>
</div>

</div>
<br />
<asp:Button ID="btnPDF" runat="server"
Text="Download PDF" OnClientClick="downloadPDF(); return false;"
Style="padding:10px
    20px;background:#e91e63;color:white;border:none;border-radius:5px;" />
</form>
</body>
</html>
