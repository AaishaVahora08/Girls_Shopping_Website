<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Customer_Login" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Customer Login</title>
    <style>
        body { font-family: Arial; background:#eee; }
        .box {
            width:350px; margin:80px auto;
            background:#fff; padding:20px;
        }
        .txt { width:100%; padding:8px; margin:5px 0; }
        .btn { width:100%; padding:10px; background:#2196F3; color:white; border:none; }
    </style>
</head>

<body>
<form id="Form1" runat="server">
    <div class="box">
        <h2>Login</h2>

        <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Placeholder="Email" />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="txt" TextMode="Password" Placeholder="Password" />

        <asp:Button ID="btnLogin" runat="server" Text="Login"
            CssClass="btn" OnClick="btnLogin_Click" />

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
    </div>
</form>
</body>
</html>
