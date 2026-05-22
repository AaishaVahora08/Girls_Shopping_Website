using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ViewOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadOrders();
        }
    }

    void loadOrders()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Orders", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvOrders.DataSource = dt;
        gvOrders.DataBind();
    }
}
