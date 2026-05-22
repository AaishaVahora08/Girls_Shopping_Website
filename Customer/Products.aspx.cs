using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["sid"] != null)
            {
                int sid = Convert.ToInt32(Request.QueryString["sid"]);
                LoadProductsBySubCategory(sid);
            }
            else
            {
                LoadAllProducts();
            }
        }
    }

    void LoadProductsBySubCategory(int sid)
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT ProductId, ProductName, Price, ImageName FROM Product WHERE SubCategoryId=@sid",
            con);
        da.SelectCommand.Parameters.AddWithValue("@sid", sid);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptProducts.DataSource = dt;
        rptProducts.DataBind();
    }

    void LoadAllProducts()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT ProductId, ProductName, Price, ImageName FROM Product",
            con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptProducts.DataSource = dt;
        rptProducts.DataBind();
    }

    protected void rptProducts_ItemCommand(object source,
        System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            Response.Redirect("ProductDetails.aspx?pid=" + e.CommandArgument);
        }

        if (e.CommandName == "add")
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            int pid = Convert.ToInt32(e.CommandArgument);
            int uid = Convert.ToInt32(Session["userid"]);

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Cart(UserId, ProductId, Qty) VALUES(@u,@p,1)", con);

            cmd.Parameters.AddWithValue("@u", uid);
            cmd.Parameters.AddWithValue("@p", pid);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("ViewCart.aspx");
        }
    }
}
