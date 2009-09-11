<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tvpage.aspx.cs" Inherits="tvpage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <title>Admin Section</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="lblMessage" runat="server" Text="! Added Successfully" ForeColor="blue" Visible="false"></asp:Label>
        <div>
            <table>
                <tr>
                    <td style="font-size: 18px; font-weight: bold;">
                        Admin Section</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">
                        Submit the file Details here</td>
                </tr>
            </table>
            <table cellpadding="4" cellspacing="0" border="0">
                <tr>
                    <td>
                        TV Guide:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTV" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1"
                            DataTextField="vch_tv_name" DataValueField="i_tv_id" Width="160" OnSelectedIndexChanged="ddlTV_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:uploadConnectionString %>"
                            SelectCommand="SELECT '0' as [i_tv_id], '[Select TV]' as [vch_tv_name] UNION  SELECT [i_tv_id], [vch_tv_name] FROM [tv]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        Program Guide:</td>
                    <td>
                        <asp:DropDownList ID="ddlProgram" runat="server" DataTextField="Text" DataValueField="Value">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProgram" runat="server" ForeColor="red" ControlToValidate="ddlProgram"
                            ErrorMessage="* Please Select Program" Display="dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Date:</td>
                    <td>
                        <asp:TextBox ID="tbCalendar" runat="server" Width="162"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/calendar.png" />
                        <asp:RequiredFieldValidator ID="rfvCalendar" ErrorMessage="* Please Select Date"
                            ControlToValidate="tbCalendar" ForeColor="red" runat="server" Display="dynamic"></asp:RequiredFieldValidator>
                        <ajaxToolkit:CalendarExtender ID="atkCalendar" runat="server" TargetControlID="tbCalendar"
                            CssClass="MyCalendar" Format="MMMM d, yyyy" PopupButtonID="Image1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        File Name:
                    </td>
                    <td>
                        <asp:FileUpload ID="fuSelectFile" Width="160" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvSelectFile" ErrorMessage="* Please Select the File Name"
                            ControlToValidate="fuSelectFile" ForeColor="red" runat="server" Display="dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
        <table>
            <tr>
                <td style="font-weight: bold; text-decoration: underline">
                    <br />
                    <br />
                    Admin Links
                </td>
            </tr>
            <tr>
                <td>
                    1.
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/manage.aspx" runat="server">Manage TV's</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    2.
                    <asp:HyperLink ID="HyperLink2" NavigateUrl="~/manage.aspx" runat="server">Manage Program's</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    3.
                    <asp:HyperLink ID="HyperLink3" NavigateUrl="~/manageProgram.aspx" runat="server">Manage TV with Program</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    4.
                    <asp:HyperLink ID="HyperLink4" NavigateUrl="~/showVideo.aspx" runat="server">Search Video</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
