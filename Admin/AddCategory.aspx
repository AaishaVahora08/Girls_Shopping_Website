<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="AddCategory.aspx.cs" Inherits="Admin_AddCategory" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Add Category</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }
        .box {
            width: 420px;
            margin: 80px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px #aaa;
        }
        h2 {
            text-align: center;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 10px;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #6a5acd;
            color: white;
            border: none;
            margin-top: 15px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="box">
        <h2>Add Category</h2>

        <asp:TextBox ID="txtName" runat="server"
            placeholder="Category Name"></asp:TextBox>

        <asp:FileUpload ID="fuImage" runat="server" />

        <asp:DropDownList ID="ddlStatus" runat="server">
            <asp:ListItem>Active</asp:ListItem>
            <asp:ListItem>Inactive</asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="btnAdd" runat="server"
            Text="Add Category" OnClick="btnAdd_Click" />
            
        <br /><br />
         <asp:Button ID="Button1" runat="server"
            Text="View Category" OnClick="btnAdd_Click" 
            PostBackUrl="~/Admin/ViewCategory.aspx" />
            <br /><br />

        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
</form>
</body>
</html>
