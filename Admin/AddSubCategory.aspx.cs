using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AddSubCategory : System.Web.UI.Page
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
        SqlDataAdapter da = new SqlDataAdapter("select CategoryId, CategoryName from Category", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryId";
        ddlCategory.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into SubCategory values(@cid,@name,@status)", con);
        cmd.Parameters.AddWithValue("@cid", ddlCategory.SelectedValue);
        cmd.Parameters.AddWithValue("@name", txtSubCategory.Text);
        cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        txtSubCategory.Text = "";
    }
}
