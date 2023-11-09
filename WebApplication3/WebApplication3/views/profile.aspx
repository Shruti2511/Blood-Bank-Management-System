<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication3.views.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 79px;
        }
         table
       {
           color:#891c1c;
       }
       td{
           padding:20px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%;height:900px; ">
    

        <div style="width:40%;height:900px;float:left">
            <asp:Image ID="Image1" runat="server" Height="277px" Width="307px" Style="margin-left:20px;margin-top:20px; border:inset"  />
            <br />
            <br />
            
             &nbsp;&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />






            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />






            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="lblname"></asp:Label>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style2">Cnic</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="lblcnic"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Email</td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="lblemail"></asp:Label>
                    </td>
                </tr>


                <tr>
                    <td class="auto-style2">Contact</td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="lblcontact"></asp:Label>
                    </td>
                </tr>
                <tr>

                    <td class="auto-style2">Age</td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="lblage"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Blood Group</td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="lblbg"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Available to Hospital</td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="lblhos"></asp:Label>
                    </td>
                </tr>

            </table>






        </div>


        <div style="width:60%;height:900px; background-color:#f8eded;float:left; background-image:url('../img/bg.jpg'); background-repeat:no-repeat; background-size:100% 100%">


        </div>





        





    </div>
    </form>
</body>
</html>
