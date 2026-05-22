<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCategory.aspx.cs" Inherits="Admin_ViewCategory" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>View Category</title>
    <style>
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f06292;
            color: white;
        }
        img {
            width: 100px;
            height: 100px;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>View Categories</h2>

        <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="CategoryId" HeaderText="ID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                    <asp:Image ID="ImgCat" runat="server" Width="100" Height="100" ImageUrl='<%# ResolveUrl("~/" + Eval("CategoryImage")) %>'/>
                      
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>
