using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = GetData();



            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
        private DataSet GetData()
        {
            string CS = ConfigurationManager.ConnectionStrings["bloodbankConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("select ud.d_id,ud.d_name,ud.d_contact,h.hos_name,di.img_path,b_name from user_donor ud inner join hospitals h on h.hos_id=ud.d_hospital left join donor_img di on ud.d_id=di.img_fk_donor inner join bloodgroup bg on bg.b_id=ud.d_blood order by d_id desc", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Repeater1.DataBind();
        } 
    }
}