<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Customer_Register" %>


<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Customer Registration</title>
    <style>
        body { font-family: Arial; background:#f2f2f2; }
        .box {
            width:400px; margin:50px auto; background:#fff;
            padding:20px; border-radius:5px;
        }
        .box h2 { text-align:center; }
        .txt { width:100%; padding:8px; margin:5px 0; }
        .btn {<a href="Register.aspx">Register.aspx</a>
            width:100%; padding:10px;
            background:#ff4081; color:white;
            border:none; cursor:pointer;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">
    <div class="box">
        <h2>Register</h2>

        <asp:TextBox ID="txtName" runat="server" CssClass="txt" Placeholder="Full Name" />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Placeholder="Email" />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="txt" TextMode="Password" Placeholder="Password" />
        <asp:TextBox ID="txtMobile" runat="server" CssClass="txt" Placeholder="Mobile No" />
        <asp:TextBox ID="txtPincode" runat="server" CssClass="txt" Placeholder="Pincode" />
        <asp:TextBox ID="txtAddress" runat="server" CssClass="txt" 
            Placeholder="Address" TextMode="MultiLine" />

        Gender:
        <asp:RadioButtonList ID="rblGender" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>

        <asp:Button ID="btnRegister" runat="server"
            Text="Register" CssClass="btn"
            OnClick="btnRegister_Click" />

        <br /><br />
        Already registered?
        <a href="Login.aspx">Login</a>

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
    </div>
</form>
</body>
</html>
