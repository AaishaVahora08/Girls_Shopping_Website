using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Agar pehle se login hai to direct dashboard par bhejo
        if (Session["admin"] != null)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Web.config se connection string lena
        string cs = ConfigurationManager
                .ConnectionStrings["AdminDBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(
    ConfigurationManager.ConnectionStrings["con"].ConnectionString);{
            string query = "SELECT COUNT(*) FROM AdminLogin WHERE Username=@u AND Password=@p";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@u", txtUser.Text.Trim());
                cmd.Parameters.AddWithValue("@p", txtPass.Text.Trim());

                con.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count == 1)
                {
                    // Login successful
                    Session["admin"] = txtUser.Text;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    // Login fail
                    lblMsg.Text = "Invalid Username or Password";
                }
            }
        }
    }
}
