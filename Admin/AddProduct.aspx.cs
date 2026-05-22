using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AddProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
        }
    }

    void BindCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select CategoryId, CategoryName from Category", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryId";
        ddlCategory.DataBind();

        ddlCategory.Items.Insert(0, "--Select Category--");
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select SubCategoryId, SubCategoryName from SubCategory where CategoryId=@cid", con);
        da.SelectCommand.Parameters.AddWithValue("@cid", ddlCategory.SelectedValue);

        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlSubCategory.DataSource = dt;
        ddlSubCategory.DataTextField = "SubCategoryName";
        ddlSubCategory.DataValueField = "SubCategoryId";
        ddlSubCategory.DataBind();

        ddlSubCategory.Items.Insert(0, "--Select SubCategory--");
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        string imgName = "";

        if (fuImage.HasFile)
        {
            imgName = Guid.NewGuid().ToString() + fuImage.FileName;
            fuImage.SaveAs(Server.MapPath("~/ProductImages/" + imgName));
        }

        SqlCommand cmd = new SqlCommand(
    "insert into Product values(@cid,@sid,@name,@price,@stock,@img)", con);

        cmd.Parameters.AddWithValue("@cid", Convert.ToInt32(ddlCategory.SelectedValue));
        cmd.Parameters.AddWithValue("@sid", Convert.ToInt32(ddlSubCategory.SelectedValue));
        cmd.Parameters.AddWithValue("@name", txtProductName.Text);
        cmd.Parameters.AddWithValue("@price", Convert.ToDecimal(txtPrice.Text));
        cmd.Parameters.AddWithValue("@stock", Convert.ToInt32(txtStock.Text));
        cmd.Parameters.AddWithValue("@img", imgName);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
}
