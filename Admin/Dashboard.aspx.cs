using System;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Security check
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            lblUser.Text = "Welcome, " + Session["admin"].ToString();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Logout logic
        Session.Clear();
        Session.Abandon();

        Response.Redirect("login.aspx");
    }
    protected void btnCategory_Click(object sender, EventArgs e)
    {

    }
}
