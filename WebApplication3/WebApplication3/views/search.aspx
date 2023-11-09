<%@ Page Title="" Language="C#" MasterPageFile="~/views/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WebApplication3.searchprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <div>
    
    <div style="background-color:#e2caca;width:100%;height:150px;">
        <br />
       

        <div>
      <span>  Blood Group:     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="b_name" DataValueField="b_id" Height="16px" Width="69px"></asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodbankConnectionString %>" SelectCommand="SELECT * FROM [bloodgroup]"></asp:SqlDataSource>
        Hospital:     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="hos_name" DataValueField="hos_id"></asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bloodbankConnectionString %>" SelectCommand="SELECT * FROM [hospitals]"></asp:SqlDataSource>
          </span>
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />

        </div>
        <h3 style="margin-left:20px"> <asp:Label ID="Label6" runat="server" Text=" " ForeColor="Green"></asp:Label>
        </h3>
        
    </div>
    <div style="width:100%;overflow:scroll;min-height:1000px">

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
</div>





    </div>



</asp:Content>
