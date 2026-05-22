using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_ViewCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerId"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadCart();
        }
    }

    void LoadCart()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT c.CartId, p.ProductName, p.Price, c.Quantity, (p.Price*c.Quantity) AS TotalPrice " +
            "FROM Cart c INNER JOIN Product p ON c.ProductId = p.ProductId " +
            "WHERE c.CustomerId=@cid", con);

        da.SelectCommand.Parameters.AddWithValue("@cid", Session["CustomerId"]);

        DataTable dt = new DataTable();
        da.Fill(dt);

        gvCart.DataSource = dt;
        gvCart.DataBind();

        int grandTotal = 0;
        foreach (DataRow row in dt.Rows)
        {
            grandTotal += Convert.ToInt32(row["TotalPrice"]);
        }

        lblTotal.Text = grandTotal.ToString();
    }

    protected void gvCart_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteItem")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Cart WHERE CartId=@cid", con);
            cmd.Parameters.AddWithValue("@cid", e.CommandArgument);
            cmd.ExecuteNonQuery();
            con.Close();

            LoadCart();
        }
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        // 🔐 Login check
        if (Session["CustomerId"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            // Total amount session me bhejo
            Session["GrandTotal"] = lblTotal.Text;

            Response.Redirect("Checkout.aspx");
        }

    }
}
