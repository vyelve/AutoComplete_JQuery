using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JqueryAutoComplete
{
    public partial class jQueryAutoCompleteTextbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<string> GetAutoCompleteData(string text)
        {
            List<string> result = new List<string>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AutoComplete"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("select ID,Name from Students where Name LIKE '%'+ @SearchText +'%'", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@SearchText", text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        //result.Add(dr["Name"]);
                        result.Add(dr["Name"].ToString());
                    }
                    return result;
                }
            }
        }
    }
}