using System;

public partial class Customer_OrderPlaced : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblOrderID.Text = Request.QueryString["oid"];
        }
    }

    protected void btnBill_Click(object sender, EventArgs e)
    {
        Response.Redirect("Bill.aspx?oid=" + lblOrderID.Text);
    }
}
