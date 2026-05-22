using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_Checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTotal();
        }
    }

    void LoadTotal()
    {
        int customerId = Convert.ToInt32(Session["CustomerID"]);
        con.Open();
        SqlCommand cmd = new SqlCommand(@"
        SELECT ISNULL(SUM(P.Price * C.Quantity),0)
        FROM Cart C
        JOIN Product P ON C.ProductID=P.ProductID
        WHERE C.CustomerID=@cid", con);

        cmd.Parameters.AddWithValue("@cid", customerId);
        lblTotal.Text = cmd.ExecuteScalar().ToString();
        con.Close();
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        int customerId = Convert.ToInt32(Session["CustomerID"]);
        con.Open();

        // Get Total
        SqlCommand cmdTotal = new SqlCommand(@"
        SELECT ISNULL(SUM(P.Price * C.Quantity),0)
        FROM Cart C
        JOIN Product P ON C.ProductID=P.ProductID
        WHERE C.CustomerID=@cid", con);

        cmdTotal.Parameters.AddWithValue("@cid", customerId);
        decimal total = Convert.ToDecimal(cmdTotal.ExecuteScalar());

        // Insert into Orders
        SqlCommand cmd = new SqlCommand(@"
        INSERT INTO Orders(CustomerID,TotalAmount,OrderDate,Status)
        VALUES(@cid,@total,GETDATE(),'Placed');
        SELECT SCOPE_IDENTITY()", con);

        cmd.Parameters.AddWithValue("@cid", customerId);
        cmd.Parameters.AddWithValue("@total", total);

        int orderId = Convert.ToInt32(cmd.ExecuteScalar());

        // Insert Order Details
        SqlCommand cmd2 = new SqlCommand(@"
        INSERT INTO OrderDetails(OrderID,ProductID,Quantity,Price)
        SELECT @oid, C.ProductID, C.Quantity, P.Price
        FROM Cart C
        JOIN Product P ON C.ProductID=P.ProductID
        WHERE C.CustomerID=@cid", con);

        cmd2.Parameters.AddWithValue("@oid", orderId);
        cmd2.Parameters.AddWithValue("@cid", customerId);
        cmd2.ExecuteNonQuery();

        // Clear Cart
        SqlCommand cmd3 = new SqlCommand("DELETE FROM Cart WHERE CustomerID=@cid", con);
        cmd3.Parameters.AddWithValue("@cid", customerId);
        cmd3.ExecuteNonQuery();

        con.Close();

        Response.Redirect("OrderPlaced.aspx?oid=" + orderId);

    }
}
