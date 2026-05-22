<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Customer_ProductDetails" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Product Details</title>

    <style>
        .box{
            width:900px;
            margin:auto;
            margin-top:30px;
            border:1px solid #ccc;
            padding:20px;
            display:flex;
            gap:30px;
        }
        .imgbox img{
            width:300px;
            height:350px;
            border:1px solid #ddd;
        }
        .details h2{
            margin:0;
        }
        .price{
            color:green;
            font-size:22px;
            margin-top:10px;
        }
        .btn{
            background:#e91e63;
            color:white;
            border:none;
            padding:10px 20px;
            margin-top:15px;
            cursor:pointer;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="box">
        <div class="imgbox">
            <asp:Image ID="imgProduct" runat="server" Width="200px" Height="200px" /> 
         
        </div>

        <div class="details">
            <h2>
                <asp:Label ID="lblName" runat="server" />
            </h2>

            <div class="price">
                ₹ <asp:Label ID="lblPrice" runat="server" />
            </div>
            <div style="margin:10px 0;">
            Quantity: 
            <asp:TextBox ID="txtQty" runat="server" Text="1" Width="50px" />
            </div>

           

            <asp:Button ID="btnCart" runat="server" Text="Add to Cart"
                CssClass="btn" OnClick="btnCart_Click" />
        </div>
    </div>

</form>
</body>
</html>

