<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="Admin_login" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<link href="css/style.css" rel="stylesheet" />
    <title>Admin Login</title>

    <style>
        body {
            background: #f2f2f2;
            font-family: Arial;
        }

        .box {
            width: 350px;
            margin: 120px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px #aaa;
        }

        .box h2 {
            text-align: center;
        }

        .box input {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }

        .box input[type=submit] {
            background: #6a5acd;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="box">
        <h2>Admin Login</h2>

        <asp:TextBox ID="txtUser" runat="server" placeholder="Username"></asp:TextBox>

        <asp:TextBox ID="txtPass" runat="server"
            TextMode="Password" placeholder="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server"
            Text="Login" OnClick="btnLogin_Click" />

        <br /><br />
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    </div>
</form>
</body>
</html>
