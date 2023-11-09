<%@ Page Title="" Language="C#" MasterPageFile="~/views/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication3._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <img src="img/02.jpg" style="height:250px;width:100%" />

   
    <div style="margin:0 auto;min-height:1000px; overflow:scroll">
    <h1 style="color:#ff0000"> <marquee direction="right">Recent Donors</marquee></h1>

         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>


             <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
        <div style="width:25%;float:left;color:#ac9696; font-family:'Arial Rounded MT' ">
           
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("d_id","~/views/viewprofile.aspx?view={0}") %>'>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img_path")%>'  Style="width:200px;height:200px; border-radius:25px 25px 25px 25px" />

           </asp:HyperLink>
            
            <table style="width: 100%;">
                <tr>
                    <td style="width: 110px">Name</td>
                    <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("d_name")%>' Style="color:#ff0000"></asp:Label></td>
                    
                </tr>
                <tr>
                    <td style="width: 110px">Near Hospital</td>
                    <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("hos_name")%>'></asp:Label></td>
                    
                </tr>
                <tr>
                    <td style="width: 110px">Blood Group</td>
                    <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("b_name")%>'></asp:Label></td>
                    
                </tr>
                <tr>
                    <td style="width: 110px">Contact</td>
                    <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("d_contact")%>'></asp:Label></td>
                    
                </tr>
               
            </table>

            

        </div>
                </ItemTemplate>
                  </asp:Repeater>



        </ContentTemplate>

    </asp:UpdatePanel>
       





    </div>









</asp:Content>
