<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewprofile.aspx.cs" Inherits="WebApplication3.views.viewprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

          
    <div>


        <div style="width:40%;height:900px;float:left;background-color:#6f1010;color:white; font-weight:300">
            <asp:Image ID="Image1" runat="server" Height="277px" Width="307px" Style="margin-left:20px;margin-top:20px; border:inset"  />
            <br />
            <br />
            
        


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



            <div>

                <h1>Your Comments
                </h1>

                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />

                <asp:TextBox ID="TextBox1" runat="server" Height="133px" TextMode="MultiLine" Width="412px"></asp:TextBox>
               <br />  <br />
                 <asp:Button ID="Button1" runat="server" Text="Comment!" BackColor="#0066FF" BorderColor="#6666FF" ForeColor="White" OnClick="Button1_Click" />
            </div>






        </div>


        <div  style="width:60%;height:900px;float:left;background-color:#6f1010;color:white; font-weight:300;overflow: scroll;">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
<div style="background-color:#f1e1e1;color:#6f1010;border-radius:30px 30px 30px 30px"> 

    <div style="margin-left:40px">    
                <p style="margin-left:20px;">   <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("img_path")%>'  Style="width:70px;height:70px; border-radius:50px 50px" /> 
                <span>  
                    <b style="color:#1e4ed4"> 
                        <%--<asp:Label ID="Label8" runat="server" ></asp:Label> --%>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("d_name")%>' NavigateUrl='<%# Eval("d_id","~/views/viewprofile.aspx?view={0}") %>' Style="text-decoration:none;color:white"></asp:HyperLink>

                    </b>      

                </span> 

            </p> 

                <p>  <asp:Label ID="Label9" runat="server" Text='<%# Eval("comment_text")%>'></asp:Label></p>

                <p>   <asp:Label ID="Label10" runat="server" Text='<%# Eval("comment_date")%>'></asp:Label>   </p>
        </div>

            </div>
                </ItemTemplate>

            </asp:Repeater>

            


        </div>


    
    </div>
    </form>
</body>
</html>
