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

public partial class manageTVs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvTVs_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        System.Collections.Hashtable h =
                    new System.Collections.Hashtable();

        foreach (System.Collections.DictionaryEntry x in e.NewValues)
        {
            h[x.Key] = x.Value;
        }

        if (Convert.ToString(h["vch_tv_name"]).Length == 0)
            lblErrorMessage.Visible = true;

        if (e.RowIndex > 0)
            return; // RowIndex=0 is the row we want to insert



        

        SqlDataSourceTVs.InsertParameters["vch_tv_name"].DefaultValue = Convert.ToString(h["vch_tv_name"]);
        SqlDataSourceTVs.Insert();
    }

    protected void gvPrograms_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (e.RowIndex > 0)
            return; // RowIndex=0 is the row we want to insert

        System.Collections.Hashtable h =
                    new System.Collections.Hashtable();

        foreach (System.Collections.DictionaryEntry x in e.NewValues)
        {
            h[x.Key] = x.Value;
        }


        SqlDataSourcePrograms.InsertParameters["vch_program_name"].DefaultValue = Convert.ToString(h["vch_program_name"]);
        SqlDataSourcePrograms.Insert();
    }
    protected void SqlDataSourceTVs_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {

    }
}
