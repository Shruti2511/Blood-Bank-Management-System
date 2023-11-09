using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.Models;

namespace WebApplication3.views
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<int> li = new List<int>();
                
                for (int i = 18; i <= 50; i++)
                {
                    li.Add(i);

                }

                DropDownList3.DataSource = li;
                DropDownList3.DataBind();
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                donors d = new donors();
                d.d_email = txtemail.Text;
                d.d_password = txtcpassword.Text;
                d.d_cinc = txtcnic.Text;
                d.d_name = txtname.Text;
                d.d_age = Convert.ToInt32(DropDownList3.SelectedValue);
                d.d_hosp_id = Convert.ToInt32(DropDownList2.SelectedValue);
                d.d_contact = TXTCONTCT.Text;
                d.d_bgroup = DropDownList2.SelectedValue.ToString();
                insert i = new insert();
                string msg = i.insert_donor(d);
                if (msg == "-1")
                {
                    Label1.Text = "some error";
                }
                else
                {
                    HttpCookie cookie = new HttpCookie("DONOR");
                    cookie["email"] = Server.UrlEncode(txtemail.Text);
                    cookie["pwd"] = Server.UrlEncode(txtcpassword.Text);
                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);
                    Session["u_id"] = msg;
                    Response.Redirect("~/views/profile.aspx");
                }
            }
          



        }
    }
}