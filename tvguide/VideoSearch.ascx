<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoSearch.ascx.cs" Inherits="VideoSearch" %>
  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
  
        
        <table cellpadding="4" cellspacing="0" border="0">
            <tr>
                <td>
                    TV:
                </td>
                <td>
                    <asp:DropDownList ID="ddlTV" runat="server" DataSourceID="SqlDataSource1" DataTextField="vch_tv_name"
                        DataValueField="i_tv_id" Width="160">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:uploadConnectionString %>"
                        SelectCommand="SELECT [i_tv_id], [vch_tv_name] FROM [tv]"></asp:SqlDataSource>
                </td>
                <td>
                    Program:</td>
                <td>
                    <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="programs" DataTextField="vch_program_name"
                        DataValueField="i_program_id" Width="160">
                    </asp:DropDownList><asp:SqlDataSource ID="programs" runat="server" ConnectionString="<%$ ConnectionStrings:uploadConnectionString %>"
                        SelectCommand="SELECT [i_program_id], [vch_program_name] FROM [program]"></asp:SqlDataSource>
                </td>
                <td>
                    Date:
                </td>
                <td>
                    <asp:TextBox ID="tbCalendar" runat="server" Width="162"></asp:TextBox>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/calendar.png" />
                    <ajaxToolkit:CalendarExtender ID="atkCalendar" runat="server" TargetControlID="tbCalendar"
                        CssClass="MyCalendar" Format="MMMM d, yyyy" PopupButtonID="Image1" />
                </td>
                <td>
                    <asp:Button ID="btnShowVideo" runat="server" Text="Show Video" OnClick="btnShowVideo_Click"  />
                </td>
            </tr>
        </table>