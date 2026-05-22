<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="Customer_ViewCart" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>My Cart</title>
    <style>
        body { font-family: Arial; background:#f5f5f5; }
        .cart-box {
            width:80%;
            margin:auto;
            background:white;
            padding:20px;
            margin-top:40px;
            border-radius:6px;
        }
        h2 { text-align:center; }
        .btn {
            padding:6px 12px;
            background:#e91e63;
            color:white;
            border:none;
            border-radius:4px;
            cursor:pointer;
        }
        .total {
            text-align:right;
            font-size:18px;
            font-weight:bold;
            margin-top:15px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="cart-box">
    <h2>My Shopping Cart</h2>

    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" Width="100%"
        OnRowCommand="gvCart_RowCommand">
        <Columns>

            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
            <asp:BoundField DataField="TotalPrice" HeaderText="Total" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Remove"
                        CommandName="DeleteItem"
                        CommandArgument='<%# Eval("CartId") %>'
                        CssClass="btn" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <div class="total">
        Total Amount: ₹ <asp:Label ID="lblTotal" runat="server"></asp:Label>
    </div>
    <asp:Button 
    ID="btnCheckout"
    runat="server"
    Text="Proceed to Checkout"
    CssClass="btn"
    OnClick="btnCheckout_Click" />


</div>

</form>
</body>
</html>
