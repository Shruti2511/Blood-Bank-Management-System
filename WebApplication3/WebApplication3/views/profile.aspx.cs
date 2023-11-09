using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WebApplication3.Models;
using System.IO;


namespace WebApplication3.views
{
    public partial class profile : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["bloodbankConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            



            HttpCookie cookie = Request.Cookies["DONOR"];
            if (cookie==null)
            {
                Response.Redirect("~/views/login.aspx");
            }
            else
            {
                if (Session["u_id"] != null)
                {

                    reutrn r = new reutrn();
                  string imgpath=  r.returnscalar("select count(img_id) from donor_img where img_fk_donor=" + Session["u_id"].ToString());
                  if (imgpath.Equals("0"))
                  {
                      Image1.ImageUrl = "~/img/profile-icon-9.png";
                      
                  }
                  else
                  {
                      Image1.ImageUrl = r.returnscalar("select img_path from donor_img where img_fk_donor=" + Session["u_id"].ToString());
                  }







                    string q = "select d_id,d_name,d_cnic,d_email,d_contact,d_age,B.B_NAME,h.hos_name from user_donor d inner join hospitals h on h.hos_id=d.d_hospital JOIN  bloodgroup B ON B.b_id=d_blood where d.d_id=" + Session["u_id"];
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

                else
                {
                    Response.Redirect("~/views/login.aspx");
                }


            }
        
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string flag=file_upload(FileUpload1,Session["u_id"].ToString());
            if (flag.Equals("-1"))
            {
                Response.Write("<script>alert('image could not be upload... '); </script> ");
            }
            else
	        {
             donor_img img = new donor_img();
             img.img_path = flag;
            
            img.img_fk_id = Convert.ToInt32 (Session["u_id"].ToString());
            insert i = new insert();
            i.insert_donor_img(img);
            Response.Redirect("~/views/profile.aspx");

	       }

            


        }


        //fileupload method.....

        public string file_upload( FileUpload fileupload ,string id)
        {
            string msg = "-1";

            if (fileupload.HasFile)
            {
                string fileextenion = Path.GetExtension(fileupload.FileName);
               
                if (fileextenion.ToLower()!=".png" && fileextenion.ToLower()!=".jpg")
                {
                    Response.Write("<script>alert('Only images are allowed to upload , please select jpg or png image.... '); </script> ");
                }
                else
                {
                    int filesize = fileupload.PostedFile.ContentLength;

                    if (filesize > 2097152) //cannot upload > 2 mb image......
                    {
                         Response.Write("<script>alert('Only images are allowed to upload that are size of less than 2 MB  '); </script> ");
                    }
                    else
                    {
                        msg = "~/Uploads/" + id + fileupload.FileName;
                        fileupload.SaveAs(Server.MapPath(msg));
                    }



                }




            }
            else
            {
                Response.Write("<script>alert('please select a file '); </script> ");

            }

            return msg;


        }//method end......









    }
}