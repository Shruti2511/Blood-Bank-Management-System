using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.Models;

namespace WebApplication3.views
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            reutrn r = new reutrn();
        string s= r.returnscalar("select count(d_id) from user_donor where d_email='" + TextBox1.Text + "'");

        if (s.Equals("0"))
        {
            Response.Write("<script>alert('This email doesnot exist') </script>");
        }
        else if (s.Equals("1"))
        {
         s =  r.returnscalar("select d_password from user_donor where d_email='" + TextBox1.Text + "'");
         if (s.Equals(TextBox2.Text))
         {

             HttpCookie cookie = new HttpCookie("DONOR");
             cookie["email"] = Server.UrlEncode(TextBox1.Text);
             cookie["pwd"] = Server.UrlEncode(TextBox2.Text);
             cookie.Expires = DateTime.Now.AddDays(30);
             Session["u_id"] = r.returnscalar("select d_id from user_donor where d_email='"+TextBox1.Text+"'");
             Response.Cookies.Add(cookie);
             Response.Redirect("~/default.aspx");


         }
         else
         {
             Response.Write("<script>alert('Invalid Password') </script>");

         }

        }
        else
        {

            Response.Write("<script>alert('some error') </script>");
        }




        
        
        }
    }
}