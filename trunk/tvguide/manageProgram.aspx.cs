using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Data.SqlClient;

public partial class manageProgram : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddProgram_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["uploadConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        SqlCommand comm = new SqlCommand("INSERT INTO [tv_program]([i_tv_id],[i_program_id]) VALUES(@tv_id,@program_id)", conn);
        comm.Parameters.AddWithValue("@tv_id", ddlTV.SelectedItem.Value);
        comm.Parameters.AddWithValue("@program_id", ddlProgram.SelectedItem.Value);
        comm.ExecuteScalar();
        Response.Redirect("manageProgram.aspx");
    }
    protected void gvTVPrograms_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect("manageProgram.aspx");
    }
}
