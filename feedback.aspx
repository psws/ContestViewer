<%@ Page Title="LogQso Feedback" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="ContestViewer.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="JavaScript" type="text/javascript">
    function back() {
        history.go(-1);
    } 
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
    <asp:SqlDataSource ID="FeedbackDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:LogQSOWeb_MDB %>" 
    ProviderName="<%$ ConnectionStrings:LogQSOWeb_MDB.ProviderName %>" 
    SelectCommand="SELECT * FROM [Feedback]"
    InsertCommand="INSERT INTO [Feedback] ([Date], [Time], [RemoteHost], [RemoteAddr], 
                        [Country],[Call],[Op], [Email], [Message]) 
                            VALUES (@Date, @Time, @RemoteHost, @Country, 
                            @RemoteAddr, @Call, @Op, @Email, @Feedback)">
        <InsertParameters>        
            <asp:Parameter Name="Date" Type="DateTime"    />   
            <asp:Parameter Name="Time" Type="DateTime"    />   
            <asp:Parameter Name="RemoteHost" Type="String"    />   
            <asp:Parameter Name="RemoteAddr" Type="String"   />   
            <asp:Parameter Name="Country" Type="String"   />   
            <asp:Parameter Name="Call" Type="String" />
            <asp:Parameter Name="Op" Type="String" />
            <asp:Parameter Name="Email" Type="String"  />
            <asp:Parameter Name="Feedback" Type="String" />
       </InsertParameters>
    </asp:SqlDataSource> 
    <div style="text-align:left; ">
    <asp:FormView ID="FormView1" runat="server"  
        CaptionAlign="Top" DefaultMode="Insert" Height="100px" Width="760px" 
        HeaderText="COMMENTS, SUGGESTIONS or QUESTIONS" BorderColor="Black" BorderStyle="Double" 
             onprerender="FormView1_PreRender" DataSourceID="FeedbackDataSource" 
            DataKeyNames="ID"   
        HorizontalAlign="Center">
         <HeaderStyle BackColor="#3399FF" BorderColor="Black" BorderStyle="Ridge" 
            BorderWidth="2px" ForeColor="White" Height="20px" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
       <InsertItemTemplate>
            <table style="width:100%;" >
                <tr>
                    <td>
                        <asp:Label ID="LabelCall" runat="server" Text="Call" AssociatedControlID="TextBoxCall" CssClass="feedbackformLabels"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelOp" runat="server" Text="Op / Name" AssociatedControlID="TextBoxOp" CssClass="feedbackformLabels"></asp:Label>
                    <td>
                        <asp:Label ID="LabelEmail" runat="server" Text="Email(optional)" AssociatedControlID="TextBoxEmail" CssClass="feedbackformLabels"></asp:Label>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxCall" runat="server"   Wrap="False" BackColor="window" 
                                 Text='<%# Bind("Call") %>'>
                       </asp:TextBox>
                   </td>
                    <td>
                        <asp:TextBox ID="TextBoxOp" runat="server"  Wrap="False" BackColor="window"
                                Text='<%# Bind("Op") %>'>
                        </asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server"  Wrap="False" BackColor="window"
                                Text='<%# Bind("Email") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td  style="height: 40px">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage='Enter ur call or "guest" in Call field' ControlToValidate="TextBoxCall"></asp:RequiredFieldValidator> 
                   </td>
                </tr>
               <tr>
                    <td colspan="3">
                        <asp:TextBox ID="TextBoxMessage" runat="server"  Height="305px" Width="725px"
                            TextMode="MultiLine"  MaxLength="1000" BackColor="window"
                                     Text='<%# Bind("Feedback") %>'>
                            </asp:TextBox>
                   </td>

                </tr>
                <tr>
                    <td  colspan="3" style="height: 30px" align="right">
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True"
                           OnCommand="FormView1_SendFeedback"
                           CommandName="SendFeedback" CssClass="feedbackform"
                           CommandArgument='<%# Request.ServerVariables["REMOTE_HOST"] %> '
                            Text="SEND MESSAGE" SkinID="butSkin" /> 
                    </td>
                    
                </tr>
           </table>
        </InsertItemTemplate>
    </asp:FormView>
 </div>   
</asp:Content>
