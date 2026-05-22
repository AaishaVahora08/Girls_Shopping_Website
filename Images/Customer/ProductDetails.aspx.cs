using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Customer_ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["pid"] != null)
            {
                int pid = Convert.ToInt32(Request.QueryString["pid"]);
                LoadProduct(pid);
            }
        }
    }

    void LoadProduct(int pid)
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        SqlCommand cmd = new SqlCommand(
            "SELECT ProductName, Price, ImageName FROM Product WHERE ProductId=@pid", con);

        cmd.Parameters.AddWithValue("@pid", pid);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            lblName.Text = dr["ProductName"].ToString();
            lblPrice.Text = dr["Price"].ToString();
            

            // 🔥 IMAGE FIX (IMPORTANT)
            imgProduct.ImageUrl = "../ProductImages/" + dr["imageName"].ToString();
        }

        con.Close();
    }

    protected void btnCart_Click(object sender, EventArgs e)
    {
        if (Session["CustomerId"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        int customerId = Convert.ToInt32(Session["CustomerId"]);
        int productId = Convert.ToInt32(Request.QueryString["pid"]);
        int qty = Convert.ToInt32(txtQty.Text);

        SqlConnection con = new SqlConnection(
             ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        {
            con.Open();

            // check product already exists
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM Cart WHERE CustomerId=@cid AND ProductId=@pid", con);
            checkCmd.Parameters.AddWithValue("@cid", customerId);
            checkCmd.Parameters.AddWithValue("@pid", productId);

            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (count > 0)
            {
                // Update quantity
                SqlCommand updateCmd = new SqlCommand(
                    "UPDATE Cart SET Quantity = Quantity + @qty WHERE CustomerId=@cid AND ProductId=@pid", con);
                updateCmd.Parameters.AddWithValue("@qty", qty);
                updateCmd.Parameters.AddWithValue("@cid", customerId);
                updateCmd.Parameters.AddWithValue("@pid", productId);
                updateCmd.ExecuteNonQuery();
            }
            else
            {
                // Insert new
                SqlCommand insertCmd = new SqlCommand(
                    "INSERT INTO Cart(CustomerId,ProductId,Quantity,AddedDate) VALUES(@cid,@pid,@qty,GETDATE())", con);
                insertCmd.Parameters.AddWithValue("@cid", customerId);
                insertCmd.Parameters.AddWithValue("@pid", productId);
                insertCmd.Parameters.AddWithValue("@qty", qty);
                insertCmd.ExecuteNonQuery();
            }
        }

        Response.Redirect("ViewCart.aspx");
    }


    }

