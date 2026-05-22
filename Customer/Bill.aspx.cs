using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Customer_Bill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBill();
        }
    }

    void LoadBill()
    {
        int oid = Convert.ToInt32(Request.QueryString["oid"]);
        lblOrderID.Text = oid.ToString();

        con.Open();

        SqlCommand cmdDate = new SqlCommand("SELECT OrderDate, TotalAmount FROM Orders WHERE OrderID=@oid", con);
        cmdDate.Parameters.AddWithValue("@oid", oid);
        SqlDataReader dr = cmdDate.ExecuteReader();
        if (dr.Read())
        {
            lblDate.Text = Convert.ToDateTime(dr["OrderDate"]).ToShortDateString();
            lblTotal.Text = dr["TotalAmount"].ToString();
        }
        dr.Close();

        SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT P.ProductName, D.Quantity, D.Price,
        (D.Quantity * D.Price) AS Total
        FROM OrderDetails D
        JOIN Product P ON D.ProductID = P.ProductID
        WHERE D.OrderID=@oid", con);

        da.SelectCommand.Parameters.AddWithValue("@oid", oid);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvBill.DataSource = dt;
        gvBill.DataBind();

        con.Close();
    }
}
