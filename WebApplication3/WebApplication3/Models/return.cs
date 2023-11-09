using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace WebApplication3.Models
{
    public class reutrn
    {
        private string cs = ConfigurationManager.ConnectionStrings["bloodbankConnectionString"].ConnectionString;



        public string returnscalar(string q)
        {
            string s = "-1";

            SqlConnection con = new SqlConnection(cs);
            try
            {
               SqlCommand cmd=new SqlCommand(q,con);
                con.Open();
             s= cmd.ExecuteScalar().ToString();

            }
            catch (Exception)
            {
                
                
            }

            finally
            {
            con.Close();
            }
            return s;

        }
    }
}