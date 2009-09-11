<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showVideo.aspx.cs" Inherits="showVideo" %>
<%@ Register Src="~/VideoSearch.ascx" TagName="videoSearch" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Video Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <uc:videoSearch ID="ucVideoSearch" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblVideo" Text="selected Video" Visible="false" runat="server"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
