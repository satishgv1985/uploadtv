using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Web.Script.Services;


/// <summary>
/// Summary description for WebServiceTV
/// </summary>
[ScriptService]
public class WebServiceTV : System.Web.Services.WebService {

    public WebServiceTV () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    public CascadingDropDownNameValue[] GetTvs(string knownCategoryValues, string category)
    {
        SqlConnection conn = new SqlConnection("Data Source=VLS-DEV;Initial Catalog=upload;Persist Security Info=True;User ID=sa;Password=sa");
        conn.Open();
        SqlCommand comm = new SqlCommand("SELECT [i_tv_id], [vch_tv_name] FROM [tv]", conn);
        SqlDataReader dr = comm.ExecuteReader();
        List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
        while (dr.Read())
        {
            l.Add(new CascadingDropDownNameValue(dr["vch_tv_name"].ToString(),
                       dr["i_tv_id"].ToString()));
        }
        conn.Close();
        return l.ToArray();
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetProgramsByTVIdMethod(string knownCategoryValues,
          string category)
    {
        int tv_id;


        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        if (!kv.ContainsKey("program") || !Int32.TryParse(kv["program"], out tv_id))
        {
            throw new ArgumentException("Couldn't find Program.");
        };


        SqlConnection conn = new SqlConnection("Data Source=VLS-DEV;Initial Catalog=upload;Persist Security Info=True;User ID=sa;Password=sa");
        conn.Open();
        SqlCommand comm = new SqlCommand("SELECT program.i_program_id, program.vch_program_name, tv.vch_tv_name FROM tv_program INNER JOIN program ON program.i_program_id=tv_program.i_program_id INNER JOIN tv ON tv.i_tv_id=tv_program.i_tv_id WHERE tv_program.i_tv_id =@i_tv_id", conn);

        comm.Parameters.AddWithValue("@i_tv_id", tv_id);

        SqlDataReader dr = comm.ExecuteReader();
        List<CascadingDropDownNameValue> l = new List<CascadingDropDownNameValue>();
        while (dr.Read())
        {
            l.Add(new CascadingDropDownNameValue(
                 dr["vch_program_name"].ToString(),
                 dr["i_program_id"].ToString()));
        }
        conn.Close();
        return l.ToArray();
    }
    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    
}

