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
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class tvadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlTV_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["uploadConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        SqlCommand comm = new SqlCommand("SELECT program.i_program_id, program.vch_program_name, tv.vch_tv_name FROM tv_program INNER JOIN program ON program.i_program_id=tv_program.i_program_id INNER JOIN tv ON tv.i_tv_id=tv_program.i_tv_id WHERE tv_program.i_tv_id =@i_tv_id", conn);
        comm.Parameters.AddWithValue("@i_tv_id", ddlTV.SelectedItem.Value);

        SqlDataReader dr = comm.ExecuteReader();
        List<ListItem> lP = new List<ListItem>();
        while (dr.Read())
        {
            lP.Add(new ListItem(dr["vch_program_name"].ToString(), dr["i_program_id"].ToString()));
        }
        conn.Close();
        ddlProgram.DataSource = lP;
        //ddlProgram.DataValueField = "i_program_id";
        //ddlProgram.DataTextField = "vch_program_name";
        ddlProgram.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string tvId = ddlTV.SelectedItem.Value;
        string programId = ddlProgram.SelectedItem.Value;
        DateTime dateAdded = Convert.ToDateTime(tbCalendar.Text);
        string filename = fuSelectFile.FileName;

        string constring = ConfigurationManager.ConnectionStrings["uploadConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(constring);
        conn.Open();

        SqlCommand comm = new SqlCommand("INSERT INTO [tv_files] ([i_tv_id],[i_program_id],[dt_tv_program_date],[vch_file_name])VALUES(@tv_id ,@program_id ,@dateadded  ,@file_name)", conn);
        comm.Parameters.AddWithValue("@tv_id", tvId);
        comm.Parameters.AddWithValue("@program_id", programId);
        comm.Parameters.AddWithValue("@dateadded", dateAdded);
        comm.Parameters.AddWithValue("@file_name", filename);
        comm.ExecuteScalar();

        lblMessage.Visible = true;
        clearControls();

    }

    private void clearControls()
    {
        tbCalendar.Text = "";
        ddlTV.SelectedIndex = 0;
    }
}
