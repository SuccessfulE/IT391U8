using System;
using System.Net;
using System.Xml.Linq;
namespace IT391U8
{
    public partial class MapPage : System.Web.UI.Page
    {
        public string strLatitude = string.Empty;
        public string strLongitude = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                strLatitude = Request.QueryString["lat"].ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("exception: " +
               ex.Message.ToString());
            }
            try
            {
                strLongitude = Request.QueryString["long"].ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("exception: " +
               ex.Message.ToString());
            }
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}