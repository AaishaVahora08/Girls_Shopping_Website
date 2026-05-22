using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ViewProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProduct();
        }
    }

    void LoadProduct()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Product", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvProduct.DataSource = dt;
        gvProduct.DataBind();
    }

    protected void gvProduct_RowCommand(object sender,
        System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int pid = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "DeleteProduct")
        {
            SqlCommand cmd = new SqlCommand(
                "delete from Product where ProductID=@id", con);
            cmd.Parameters.AddWithValue("@id", pid);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadProduct();
        }

        if (e.CommandName == "EditProduct")
        {
            Response.Redirect("EditProduct.aspx?id=" + pid);
        }
    }
}
