using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
public partial class Customer_SubCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["cid"] != null)
            {
                int cid = Convert.ToInt32(Request.QueryString["cid"]);
                LoadSubCategory(cid);
            }
        }
    }

    void LoadSubCategory(int cid)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT SubCategoryId, SubCategoryName FROM SubCategory WHERE CategoryId=@cid", con);
        da.SelectCommand.Parameters.AddWithValue("@cid", cid);

        DataTable dt = new DataTable();
        da.Fill(dt);

        dlSubCategory.DataSource = dt;
        dlSubCategory.DataBind();
    }

    protected void lnkSub_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Products.aspx?sid=" + e.CommandArgument);
    }
}
