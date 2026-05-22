<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Customer_Checkout" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>Checkout</title>

<style>
body{
    background:#f5f5f5;
    font-family:Arial;
}
.checkout-box{
    width:450px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:8px;
    box-shadow:0 0 15px #ccc;
}
.checkout-box h2{
    text-align:center;
    color:#e91e63;
}
.input{
    width:100%;
    padding:10px;
    margin-top:10px;
    border:1px solid #ccc;
    border-radius:5px;
}
.btn{
    width:100%;
    background:#e91e63;
    color:white;
    padding:12px;
    border:none;
    border-radius:5px;
    margin-top:20px;
    font-size:16px;
    cursor:pointer;
}
.btn:hover{
    background:#c2185b;
}
.total{
    font-size:18px;
    margin-top:10px;
    color:green;
    font-weight:bold;
}
</style>
</head>

<body>
<form id="form1" runat="server">

<div class="checkout-box">
<h2>Checkout</h2>

Full Name
<asp:TextBox ID="txtName" runat="server" CssClass="input" />

Mobile
<asp:TextBox ID="txtMobile" runat="server" CssClass="input" />

Delivery Address
<asp:TextBox ID="txtAddress" runat="server" CssClass="input" TextMode="MultiLine" Rows="3" />

<div class="total">
Total: ₹ <asp:Label ID="lblTotal" runat="server"></asp:Label>
</div>

<asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn" OnClick="btnPlaceOrder_Click" />

</div>

</form>
</body>
</html>
