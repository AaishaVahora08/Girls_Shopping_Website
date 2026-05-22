using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();

        SqlCommand cmd = new SqlCommand(
            "SELECT CustomerID FROM Customer WHERE Email=@e AND Password=@p", con);

        cmd.Parameters.AddWithValue("@e", txtEmail.Text);
        cmd.Parameters.AddWithValue("@p", txtPassword.Text);

        object result = cmd.ExecuteScalar();

        if (result != null)
        {
            Session["CustomerId"] = result.ToString();

            // 🔴 IMPORTANT PART
            if (Session["ReturnUrl"] != null)
            {
                string url = Session["ReturnUrl"].ToString();
                Session.Remove("ReturnUrl");
                Response.Redirect(url);
            }
            else
            {
                Response.Redirect("~/Default2.aspx");
            }
        }
        else
        {
            lblMsg.Text = "Invalid Email or Password";
        }

        con.Close();
    }

}
