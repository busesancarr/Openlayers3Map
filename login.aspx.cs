using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace OpenlayersMap
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {

                if (Request.Cookies["hariti-uname"] != null)
                {
                    username.Text = Request.Cookies["hariti-uname"].Value;
                }
                if (Request.Cookies["hariti-pwd"] != null)
                {
                    password.Attributes.Add("value", Request.Cookies["hariti-pwd"].Value);

                }

                if (Request.Cookies["hariti-uname"] != null && Request.Cookies["hariti-pwd"] != null)
                {
                    remenber.Checked = true;
                }

            }
        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection scon = new SqlConnection("Data Source=DESKTOP-S4RLEF4\\SQLEXPRESS;Initial Catalog=dtb.harita;Integrated Security=True");
            String myquery = "select * from login where username='" + username.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            String uname;
            String pass;
            if (ds.Tables[0].Rows.Count > 0)
            {
                uname = ds.Tables[0].Rows[0]["username"].ToString();
                pass = ds.Tables[0].Rows[0]["password"].ToString();

                scon.Close();
                if (uname == username.Text && pass == password.Text)
                {
                    Session["username"] = uname;
                    if (remenber.Checked == true)
                    {
                        Response.Cookies["hariti-uname"].Value = username.Text;
                        Response.Cookies["hariti-pwd"].Value = password.Text;
                        Response.Cookies["hariti-uname"].Expires = DateTime.Now.AddDays(10);
                        Response.Cookies["hariti-pwd"].Expires = DateTime.Now.AddDays(10);
                    }
                    else
                    {
                        Response.Cookies["hariti-uname"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["hariti-pwd"].Expires = DateTime.Now.AddDays(-1);
                    }
                    Response.Redirect("Harita.aspx");
                }
                else
                {
                    Label1.Text = "Geçersiz Kullanıcı Adı veya Şifre - Doğru Kullanıcı Adı Şifresi ile Yeniden Giriş Yapın";
                }
            }
            else
            {
                Label1.Text = "Geçersiz Kullanıcı Adı veya Şifre - Doğru Kullanıcı Adı Şifresi ile Yeniden Giriş Yapın";
            }
        }
    }
}