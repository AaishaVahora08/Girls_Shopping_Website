using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_EditProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["con"].ConnectionString);

            SqlCommand cmd = new SqlCommand(
                "select * from Product where ProductID=@id", con);

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtProductName.Text = dr["ProductName"].ToString();
                txtPrice.Text = dr["Price"].ToString();
                //txtDescription.Text = dr["Description"].ToString();
            }
            con.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);

        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        SqlCommand cmd = new SqlCommand(
            "update Product set ProductName=@name, Price=@price where ProductID=@id",
            con);

        cmd.Parameters.AddWithValue("@name", txtProductName.Text);
        cmd.Parameters.AddWithValue("@price", txtPrice.Text);
        //cmd.Parameters.AddWithValue("@desc", txtDescription.Text);
        cmd.Parameters.AddWithValue("@id", id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("ViewProduct.aspx");
    }
}
