using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ViewCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
     ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategory();
        }
    }

    void LoadCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Category", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvCategory.DataSource = dt;
        gvCategory.DataBind();
    }
}
