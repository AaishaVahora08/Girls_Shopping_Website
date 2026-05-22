<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="SubCategory.aspx.cs"
    Inherits="Customer_SubCategory" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Sub Categories</title>
</head>
<body>
<form id="Form1" runat="server">

<asp:DataList ID="dlSubCategory" runat="server"
    RepeatColumns="4" CellPadding="10">
    <ItemTemplate>
        <div style="border:1px solid #ccc;padding:10px;text-align:center">
            <asp:LinkButton ID="lnkSub" runat="server"
                Text='<%# Eval("SubCategoryName") %>'
                CommandArgument='<%# Eval("SubCategoryId") %>'
                OnCommand="lnkSub_Command" />
        </div>
    </ItemTemplate>
</asp:DataList>

</form>
</body>
</html>
