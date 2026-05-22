using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ViewSubCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
    ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSubCategory();
        }
    }

    void LoadSubCategory()
    {
        string query = @"SELECT s.SubCategoryId,
                                c.CategoryName,
                                s.SubCategoryName,
                                s.Status
                         FROM SubCategory s
                         INNER JOIN Category c
                         ON s.CategoryId = c.CategoryId";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvSubCategory.DataSource = dt;
        gvSubCategory.DataBind();
    }

    // EDIT
    protected void gvSubCategory_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        gvSubCategory.EditIndex = e.NewEditIndex;
        LoadSubCategory();
    }

    // CANCEL
    protected void gvSubCategory_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        gvSubCategory.EditIndex = -1;
        LoadSubCategory();
    }

    // UPDATE
    protected void gvSubCategory_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvSubCategory.DataKeys[e.RowIndex].Value);

        string subCatName =
            ((System.Web.UI.WebControls.TextBox)gvSubCategory.Rows[e.RowIndex]
            .Cells[2].Controls[0]).Text;

        string status =
            ((System.Web.UI.WebControls.TextBox)gvSubCategory.Rows[e.RowIndex]
            .Cells[3].Controls[0]).Text;

        SqlCommand cmd = new SqlCommand(
            "UPDATE SubCategory SET SubCategoryName=@n, Status=@s WHERE SubCategoryId=@id", con);

        cmd.Parameters.AddWithValue("@n", subCatName);
        cmd.Parameters.AddWithValue("@s", status);
        cmd.Parameters.AddWithValue("@id", id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        gvSubCategory.EditIndex = -1;
        LoadSubCategory();
    }

    // DELETE
    protected void gvSubCategory_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvSubCategory.DataKeys[e.RowIndex].Value);

        SqlCommand cmd = new SqlCommand(
            "DELETE FROM SubCategory WHERE SubCategoryId=@id", con);

        cmd.Parameters.AddWithValue("@id", id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        LoadSubCategory();
    }
}
