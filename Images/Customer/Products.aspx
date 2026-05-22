<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Products.aspx.cs"
    Inherits="Customer_Products" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Products</title>
</head>
<body>
<form id="Form1" runat="server">

<asp:Repeater ID="rptProducts" runat="server"
    OnItemCommand="rptProducts_ItemCommand">
<ItemTemplate>
    <div style="width:220px;float:left;border:1px solid #ccc;margin:10px;padding:10px">
      
      <img src='<%# "../ProductImages/" + Eval("ImageName") %>' 
             style="width:200px;height:200px" /><br /> 

        <b><%# Eval("ProductName") %></b><br />
        ₹ <%# Eval("Price") %><br /><br />

        <asp:LinkButton ID="lnkView" runat="server"
            Text="View"
            CommandName="view"
            CommandArgument='<%# Eval("ProductId") %>' />
        &nbsp;
        
    </div>
</ItemTemplate>
</asp:Repeater>

</form>
</body>
</html>
