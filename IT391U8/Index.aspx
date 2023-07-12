<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IT391U8.Index" UnobtrusiveValidationMode="None" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

 <title></title>
</head>
<body>


     <form id="form1" runat="server">
         <div>
             <asp:Label ID="Label1" Width="75" runat="server" Text="Street:"></asp:Label>
             <asp:TextBox ID="txtStreet" Width="225" runat="server" Text = "1250 1st Ave S"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Street is REQUIRED"
                ControlToValidate="txtStreet" Display="Dynamic" ForeColor="Red" 
                ></asp:RequiredFieldValidator>
         <p>
             <asp:Label ID="Label2" Width="75" runat="server" Text="City:"></asp:Label>
             <asp:TextBox ID="txtCity" Width="150" runat="server">Seattle</asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="City is REQUIRED"
                ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" 
                ></asp:RequiredFieldValidator>
         </p>
         <p>
             <asp:Label ID="Label3" Width="75" runat="server" Text="State:"></asp:Label>
             <asp:TextBox ID="txtState" Width="150" runat="server">Washington</asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="State is REQUIRED"
                ControlToValidate="txtState" Display="Dynamic" ForeColor="Red" 
                ></asp:RequiredFieldValidator>
         </p>
         <p>
             <asp:Label ID="Label4" Width="75" runat="server" Text="Zip:"></asp:Label>
             <asp:TextBox ID="txtZip" Width="150" runat="server">98134</asp:TextBox>
             <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Please enter a maximum of 5 characters." 
                 Display="Dynamic" ForeColor="Red"
                ValidationExpression="^([\S\s]{0,5})$"  
                ControlToValidate="txtZip" ></asp:RequiredFieldValidator>
         </p>
         <p>
            <asp:Button ID="btnMap" runat="server" OnClick="btnMap_Click" Text="Go to Google Maps"/>
         </p>
         </div>
     </form>
</body>
</html>