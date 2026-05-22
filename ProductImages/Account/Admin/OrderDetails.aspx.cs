using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_OrderDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    int oid;

    protected void Page_Load(object sender, EventArgs e)
    {
        oid = Convert.ToInt32(Request.QueryString["oid"]);

        if (!IsPostBack)
        {
            loadDetails();
        }
    }

    void loadDetails()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "select * from OrderDetails where OrderID=" + oid, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand(
            "update Orders set Status=@s where OrderID=@id", con);
        cmd.Parameters.AddWithValue("@s", ddlStatus.SelectedValue);
        cmd.Parameters.AddWithValue("@id", oid);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
