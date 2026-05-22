<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="ViewSubCategory.aspx.cs"
    Inherits="Admin_ViewSubCategory" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>View Sub Category</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f8;
        }

        .container {
            width: 95%;
            margin: auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .grid {
            width: 100%;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

<div class="container">
    <h2>View Sub Categories</h2>

    <asp:GridView ID="gvSubCategory" runat="server"
        CssClass="grid"
        AutoGenerateColumns="False"
        DataKeyNames="SubCategoryId"
        OnRowEditing="gvSubCategory_RowEditing"
        OnRowUpdating="gvSubCategory_RowUpdating"
        OnRowCancelingEdit="gvSubCategory_RowCancelingEdit"
        OnRowDeleting="gvSubCategory_RowDeleting">

        <Columns>
            <asp:BoundField DataField="SubCategoryId" HeaderText="ID" ReadOnly="true" />

            <asp:BoundField DataField="CategoryName"
                HeaderText="Category"
                ReadOnly="true" />

            <asp:BoundField DataField="SubCategoryName"
                HeaderText="Sub Category" />

            <asp:BoundField DataField="Status"
                HeaderText="Status" />

            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</div>

</form>
</body>
</html>
