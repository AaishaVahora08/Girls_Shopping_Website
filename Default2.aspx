 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2"%>

<!DOCTYPE html>
<script runat="server">

    protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

    }
</script>
<html>
<head id="Head1" runat="server">
<base href="/GirlsShopping/" />
     <title>Shopping Website</title>
        body { margin:0; font-family:Arial; }

        /* MENU */
        .menu {

    <style>
            background:Liner-gradient(90deg,#ff2f92,#ff8a00);
            padding:14px;
            text-align:center;
            box-shadow:0 2px 10px rgba(0,0,0.2);
        }
        .menu a {
            color:white;
            text-decoration:none;
            margin:15px;
            font-size:16px;
            margin:0 15px;
           
        }
        .menu a:hover { background:white
                        color:#ff2f92; }

        /* ===== SLIDER ===== */
        .slider {
            width: 100%;
            height: 350px;
            overflow: hidden;
            margin-top:10px;
        }

        .slides {
            width: 300%;
            height: 350px;
            display: flex;
            animation: slide 12s infinite;
        }

        .slides img {
            width: 100%;
            height: 350px;
        }

        @keyframes slide {
            0% { margin-left: 0%; }
            33% { margin-left: -100%; }
            66% { margin-left: -200%; }
        }

       
        .menu a
        {
            color:White;
            text-decoration:none;
            margin:0 20px;
            font-size:17px;
            font-weight:600px;
        }
        .menu a:hover{
    color:black;
}
.shop-title
{
    background: Liner-gradient(to right, #ff2e8a, #ff6fa5);
    color:White;
    font-size:40px;
    text-align:center;
    padding:20px;
    font-weight:bold;
    letter-spacing:2px;
}


/* 🔥 CATEGORY TITLE */
.cat-title{
    text-align:center;
    font-size:30px;
    color:#ff2f92;
    margin-top:30px;
}

/* 🔥 CATEGORY BOX */
.category-box{
    background:white;
    padding:15px;
    
}


        .product-box img {
            width: 100%;
            height: 200px;
        }

        .price {
            color: green;
            font-weight: bold;
        }

        .btn {
            background: #e91e63;
            color: white;
            padding: 8px 15px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>


<body background="About.aspx" bgcolor="Black" link="Black">


<form id="form1" runat="server">



    <!-- MENU -->
    <div class="menu" style="color: #FFFFFF; background-color: #000000;">
        <a href="Default2.aspx">Home</a>
    
        <a href="About.aspx">About Us</a>
        <a href="Customer/Products.aspx">Products</a>
         <a href="Customer/Login.aspx">Login</a>
        <a href="Customer/Register.aspx">Register</a>
        <a href="Customer/ViewCart.aspx">Cart</a>
          </div>

         
<div class= "shop-title">
Online Girls Shopping</div>
    
    



    <!-- ===== SLIDER ===== -->
    <div class="slider">
        <div class="slides">
            <img src="Images/slider1.jpg" />
            <img src="Images/slider2.jpg" />
            <img src="Images/slider3.jpg" />
        </div>


    </div>
    <h2 class="cat-title">Shop By Category</h2>

   
    
        
  

  <asp:DataList ID="dlCategory" runat="server"
    RepeatColumns="5"
    RepeatDirection="Horizontal"
    CellPadding="15"
    CellSpacing="10"
    Width="100%" BackColor="White" BorderStyle="None">

      <ItemTemplate>
    <div style="
        width:180px;
        text-align:center;
        border:1px solid #ddd;
        padding:10px;
        margin:5px;
       
        background:white;
    ">

        <div class=" category-box "></div><asp:Image 
            ID="imgCat"
            runat="server"
            Width="150"
            Height="150"
            Style="object-fit:cover"
            ImageUrl='<%# ResolveUrl("~/" + Eval("CategoryImage")) %>' />

        <br /><br />

        <a href='Customer/SubCategory.aspx?cid=<%# Eval("CategoryId") %>'
           style="text-decoration:none; font-weight:bold; color:black;">
            <%# Eval("CategoryName") %>
        </a>

    </div>
</ItemTemplate>


    </asp:DataList>
    </form>






<div style="clear:both">
    </div>



        
   

</body>
</html>