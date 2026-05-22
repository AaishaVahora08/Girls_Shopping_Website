using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategory();
        }
    }


    void LoadCategory()
    {
        SqlConnection con = new SqlConnection(
        @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ADMINDB.mdf;
          Integrated Security=True;User Instance=True");

        SqlDataAdapter da = new SqlDataAdapter(
        "SELECT CategoryId, CategoryName, CategoryImage FROM Category WHERE Status='Active'", con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        dlCategory.DataSource = dt;
        dlCategory.DataBind();
    }
    protected void lnkCat_Command(object sender, CommandEventArgs e)
    {
        int cid = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("Customer/SubCategory.aspx?cid=" + cid);
    }


    protected void lnkCart_Click(object sender, EventArgs e)
    {
        // check user login hai ya nahi
        if (Session["CustomerID"] == null)
        {
            Session["ReturnUrl"] = "ViewCart.aspx";
            Response.Redirect("~/Customer/Login.aspx");
        }
        else
        {
            Response.Redirect("~/Customer/ViewCart.aspx");
        }
    }
}
