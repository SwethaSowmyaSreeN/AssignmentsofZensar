using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentASP
{
    public partial class Validator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string[] str = new string[] { "Select", "Oppo", "Vivo", "Oneplus","IPhone" };
                for (int i = 0; i < str.Length; i++)
                {
                    DropDownList1.Items.Add(str[i]);
                }
            }
        }
       

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = DropDownList1.Text;
            Image1.ImageUrl = "~/Images/" + str + ".JPG";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Oppo")
            {
                TextBox1.Text = "23000";
            }
            else if (DropDownList1.SelectedValue == "IPhone")
            {
                TextBox1.Text = "89000";
            }
            else if (DropDownList1.SelectedValue == "Oneplus")
            {
                TextBox1.Text = "62000";
            }
            else if (DropDownList1.SelectedValue == "Vivo")
            {
                TextBox1.Text = "32000";
            }

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}