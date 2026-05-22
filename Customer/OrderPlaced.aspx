<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderPlaced.aspx.cs" Inherits="Customer_OrderPlaced" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>Order Placed</title>

<style>
body{
    background:#f5f5f5;
    font-family:Arial;
}
.box{
    width:450px;
    margin:100px auto;
    background:white;
    padding:30px;
    text-align:center;
    box-shadow:0 0 10px #ccc;
    border-radius:8px;
}
h2{
    color:green;
}
.btn{
    background:#e91e63;
    color:white;
    padding:10px 20px;
    border:none;
    border-radius:5px;
    cursor:pointer;
}
</style>
</head>

<body>
<form id="Form1" runat="server">
<div class="box">
    <h2>🎉 Order Placed Successfully!</h2>
    <p>Your Order ID is: 
        <asp:Label ID="lblOrderID" runat="server"></asp:Label>
    </p>

    <asp:Button ID="btnBill" runat="server" Text="View Invoice" CssClass="btn" OnClick="btnBill_Click"/>
</div>
</form>
</body>
</html>
