<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="ViewProduct.aspx.cs"
    Inherits="Admin_ViewProduct" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>View Product</title>
    <style>
        .grid { width:100%; border-collapse:collapse; }
        .grid th { background:#f06292; color:white; padding:8px; }
        .grid td { padding:8px; text-align:center; }
        .btn { padding:5px 10px; }
    </style>
</head>
<body>
<form id="form1" runat="server">

<asp:GridView ID="gvProduct" runat="server"
    AutoGenerateColumns="False"
    CssClass="grid"
    DataKeyNames="ProductID"
    OnRowCommand="gvProduct_RowCommand">

    <Columns>

        <asp:BoundField DataField="ProductID" HeaderText="ID" />
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
        <asp:BoundField DataField="Price" HeaderText="Price" />
        <asp:BoundField DataField="StockName" HeaderText="Stock" />

        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="imgProduct" runat="server"
                    ImageUrl='<%# "~/ProductImages/" + Eval("ImageName") %>'
                    Width="80" Height="80" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server"
                    Text="Edit"
                    CssClass="btn"
                    CommandName="EditProduct"
                    CommandArgument='<%# Eval("ProductID") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server"
                    Text="Delete"
                    CssClass="btn"
                    CommandName="DeleteProduct"
                    CommandArgument='<%# Eval("ProductID") %>'
                    OnClientClick="return confirm('Are you sure?');" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>

</form>
</body>
</html>
