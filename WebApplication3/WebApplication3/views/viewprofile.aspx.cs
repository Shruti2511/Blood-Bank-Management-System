using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.Models;

namespace WebApplication3.views
{
    public partial class viewprofile : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["bloodbankConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
                if (Request.QueryString["view"]!=null)
                {
                    HiddenField1.Value = Request.QueryString["view"].ToString();
                    
                }
                else
                {
                    Response.Redirect("~/default.aspx");
                }
    
            

            DataSet ds = GetData();



            Repeater1.DataSource = ds;
            Repeater1.DataBind();


            reutrn r = new reutrn();
            string imgpath = r.returnscalar("select count(img_id) from donor_img where img_fk_donor=" +HiddenField1.Value);
            if (imgpath.Equals("0"))
            {
                Image1.ImageUrl = "~/img/profile-icon-9.png";

            }
            else
            {
                Image1.ImageUrl = r.returnscalar("select img_path from donor_img where img_fk_donor="  +HiddenField1.Value);
            }







            string q = "select d_id,d_name,d_cnic,d_email,d_contact,d_age,B.B_NAME,h.hos_name from user_donor d inner join hospitals h on h.hos_id=d.d_hospital JOIN  bloodgroup B ON B.b_id=d_blood where d.d_id="  +HiddenField1.Value;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                SqlCommand cmd = new SqlCommand(q, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Label1.Text = reader.GetValue(1).ToString();
                    Label2.Text = reader.GetValue(2).ToString();
                    Label3.Text = reader.GetValue(3).ToString();
                    Label4.Text = reader.GetValue(4).ToString();
                    Label5.Text = reader.GetValue(5).ToString();
                    Label6.Text = reader.GetValue(6).ToString();
                    Label7.Text = reader.GetValue(7).ToString();
                }






            }
            catch (Exception)
            {


            }
            finally
            {
                con.Close();
            }



        }


        private DataSet GetData()
        {
            string CS = ConfigurationManager.ConnectionStrings["bloodbankConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("select  ud.d_id,c.comment_text,c.comment_date,c.comment_fk_fromprofileid,di.img_path,ud.d_name from comments c inner join user_donor ud on ud.d_id=c.comment_fk_fromprofileid  inner join donor_img di on di.img_fk_donor=c.comment_fk_fromprofileid where c.comment_fk_onprofileid=" + HiddenField1.Value + "order by comment_date desc", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        } 
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["u_id"]==null)
            {

                Response.Write("<script>alert('you must login 1st'); </script>");
                Response.Redirect("~/views/login.aspx");
            }


            comment c = new comment();
            c.cidfkon = Convert.ToInt32(HiddenField1.Value);
            c.cidfkfrom = Convert.ToInt32(Session["u_id"].ToString());
            c.commenttxt = TextBox1.Text;
            insert i = new insert();
            i.insert_comment(c);
            Server.Transfer("~/views/viewprofile.aspx?view="+HiddenField1.Value);

        }
    }
}