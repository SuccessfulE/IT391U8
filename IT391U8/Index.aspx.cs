using Microsoft.Win32;
using System;
using System.Net;
using System.Xml.Linq;
namespace IT391U8
{
    //
    //https://code.google.com/p/geocodingapi/
    //
    //
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnMap_Click(object sender, EventArgs e)
        {
            //http://stackoverflow.com/questions/16274508/how-to-call-google-geocodeservice-from-c-sharp-code
            string address = txtStreet.Text + " " + txtCity.Text + " " + txtState.Text + " " + txtZip.Text;
            txtStreet.Text = string.Empty; 
            txtCity.Text = string.Empty; 
            txtState.Text = string.Empty;
            txtZip.Text = string.Empty;

            var gKey = "AIzaSyCTuqyhYQnKcInGOfyZavrw9c45ntMGE9c";
             
            var requestUri =
            string.Format("https://maps.googleapis.com/maps/api/geocode/xml?key={1}&address={0}&sensor = false",
            Uri.EscapeDataString(address), gKey);

            WebRequest request = WebRequest.Create(requestUri);
            WebResponse response = request.GetResponse();
            XDocument xdoc = XDocument.Load(response.GetResponseStream());
            var result = xdoc.Element("GeocodeResponse").Element("result");
            var locationElement = result.Element("geometry").Element("location");
            String strLatitude = locationElement.Element("lat").ToString(); //Gets < lat > 26.5417134 </ lat >
            strLatitude = strLatitude.Substring(5); //Slices off the <lat> tag
            strLatitude = strLatitude.Substring(0, strLatitude.Length - 6); //Slices off the </ lat > tag
            String strLongitude = locationElement.Element("lng").ToString();
            strLongitude = strLongitude.Substring(5);
            strLongitude = strLongitude.Substring(0, strLongitude.Length - 6);
            Response.Redirect("MapPage.aspx?lat=" + strLatitude + "&long=" + strLongitude);
        }
    }
}
