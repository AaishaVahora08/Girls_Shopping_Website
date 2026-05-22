using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        con.Open();

        // Check email already exists
        SqlCommand check = new SqlCommand(
            "SELECT COUNT(*) FROM Customer WHERE Email=@email", con);
        check.Parameters.AddWithValue("@email", txtEmail.Text);

        int exists = (int)check.ExecuteScalar();

        if (exists > 0)
        {
            lblMsg.Text = "Email already registered!";
            con.Close();
            return;
        }

        SqlCommand cmd = new SqlCommand(
            "INSERT INTO Customer (FullName,Email,Password,Mobile,Pincode,Address,Gender) " +
            "VALUES (@n,@e,@p,@m,@pin,@a,@g)", con);

        cmd.Parameters.AddWithValue("@n", txtName.Text);
        cmd.Parameters.AddWithValue("@e", txtEmail.Text);
        cmd.Parameters.AddWithValue("@p", txtPassword.Text);
        cmd.Parameters.AddWithValue("@m", txtMobile.Text);
        cmd.Parameters.AddWithValue("@pin", txtPincode.Text);
        cmd.Parameters.AddWithValue("@a", txtAddress.Text);
        cmd.Parameters.AddWithValue("@g", rblGender.SelectedValue);

        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("Login.aspx");
    }
}
