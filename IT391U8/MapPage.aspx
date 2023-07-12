<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapPage.aspx.cs" Inherits="IT391U8.MapPage"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
     <div>
     <script type="text/javascript"src="
     https://maps.googleapis.com/maps/api/js?key=AIzaSyCTuqyhYQnKcInGOfyZavrw9c45ntMGE9c&sensor=false"></script>
     <script type="text/javascript">

     if (navigator.geolocation) {
     navigator.geolocation.getCurrentPosition(function (p) {

         var Lat = <%=this.strLatitude%>;
         var Long = <%=this.strLongitude%>;
         var LatLng = new google.maps.LatLng(<%=this.strLatitude%>, <%=this.strLongitude%>);

         var mapOptions = { center: LatLng, zoom: 13, mapTypeId:google.maps.MapTypeId.ROADMAP };
         var mapOptions2 = { center: LatLng, zoom: 13, mapTypeId:google.maps.MapTypeId.SATELLITE };
         var mapOptions3 = { center: LatLng, zoom: 13, mapTypeId:google.maps.MapTypeId.HYBRID };
         var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
         var map2 = new google.maps.Map(document.getElementById("dvMap2"),mapOptions2);
         var map3 = new google.maps.Map(document.getElementById("dvMap3"), mapOptions3);

         var marker = new google.maps.Marker({ position: LatLng, map: map, title:
        "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: " + Lat +
        "<br />Longitude: " + Long });
         var marker2 = new google.maps.Marker({ position: LatLng, map: map2, title:
        "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: " + Lat +
        "<br />Longitude: " + Long });
         var marker3 = new google.maps.Marker({ position: LatLng, map: map3, title: 
             "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: " + <%=this.strLatitude%> +
             "<br />Longitude: " + <%=this.strLongitude%>});

         google.maps.event.addListener(marker, "click", function (e) {
         var infoWindow = new google.maps.InfoWindow();
         infoWindow.setContent(marker.title);
         infoWindow.open(map, marker);
         });
         google.maps.event.addListener(marker2, "click", function (e) {
         var infoWindow2 = new google.maps.InfoWindow();
         infoWindow2.setContent(marker2.title);
         infoWindow2.open(map2, marker2);
         });
         google.maps.event.addListener(marker3, "click", function (e) {
         var infoWindow3 = new google.maps.InfoWindow();
         infoWindow3.setContent(marker3.title);
         infoWindow3.open(map3, marker3);
          });
        });
     } else {
            alert('Geo Location feature is not supported in this browser.');
     }

     </script>

        <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" />
     
         <h4>Google API ROADMAP</h4>
         <asp:panel id="dvMap" style="width: 400px; height: 400px" runat ="server"></asp:panel>
         <h4>Google API SATELITTE MAP</h4>
         <asp:panel id="dvMap2" style="width: 400px; height: 400px" runat="server"></asp:panel>
         <h4>Google API HYBRID MAP</h4>
         <asp:panel id="dvMap3" style="width: 400px; height: 400px" runat="server"></asp:panel>
        </div>
     </form>
</body>
</html>