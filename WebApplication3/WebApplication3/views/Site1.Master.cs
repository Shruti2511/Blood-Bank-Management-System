using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.Models;

namespace WebApplication3.views
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["u_id"]==null)
            {
                LinkButton1.Text = "Login";
                LinkButton2.Text = "Sign Up";

            }
            else
            {
                reutrn r = new reutrn();
                LinkButton1.Text = r.returnscalar("select d_name from user_donor where d_id=" + Session["u_id"]);
                LinkButton2.Text = "Log Out";
            }
        
        
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["u_id"] == null)
            {
                Response.Redirect("~/views/login.aspx");
            }
            else
            {
                Response.Redirect("~/views/profile.aspx");
                
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Session["u_id"] == null)
            {
                Response.Redirect("~/views/signup.aspx");
            }
            else
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("~/default.aspx");
            }
        }
    }
}