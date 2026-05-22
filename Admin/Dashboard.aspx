<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .box {
            width: 400px;
            margin: 100px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 0 10px #aaa;
        }

        h2 {
            color: #333;
        }

        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background: #6a5acd;
            color: white;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background: #483d8b;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="box">
        <h2>Admin Dashboard</h2>

        <asp:Label ID="lblUser" runat="server"></asp:Label>
        <br /><br />

        <!-- Future menu -->
        <asp:Button ID="btnCategory" runat="server"
            Text="Manage Category" CssClass="btn" onclick="btnCategory_Click" 
            PostBackUrl="~/Admin/AddCategory.aspx" />

              <asp:Button ID="btnSubCategory" runat="server"
            Text="Manage SubCategory" CssClass="btn" 
            PostBackUrl="~/Admin/AddSubCategory.aspx" />

        <asp:Button ID="btnProduct" runat="server"
            Text="Manage Products" CssClass="btn" 
            PostBackUrl="~/Admin/AddProduct.aspx" />

        <!-- Logout -->
        <asp:Button ID="btnLogout" runat="server"
            Text="Logout" CssClass="btn"
            OnClick="btnLogout_Click" />
    </div>
</form>
</body>
</html>
