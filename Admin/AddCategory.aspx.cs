using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_AddCategory : System.Web.UI.Page
{
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (fuImage.HasFile)
        {
            string CategoryImage = Path.GetFileName(fuImage.FileName);
            string imgPath = "~/Images/Category/" + CategoryImage;
            fuImage.SaveAs(Server.MapPath(imgPath));

            string cs = ConfigurationManager
                .ConnectionStrings["AdminDBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(
    ConfigurationManager.ConnectionStrings["con"].ConnectionString);


            string query = "INSERT INTO Category (CategoryName, CategoryImage, Status) " +
                           "VALUES (@n, @i, @s)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@i", imgPath);
            cmd.Parameters.AddWithValue("@s", ddlStatus.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Category Added Successfully";
        }
        else
        {
            lblMsg.Text = "Please select image";
        }
    }
}
