<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>home page</title>
    <link rel="stylesheet" type="text/css" href="contentslider.css" />
    <link rel="stylesheet" type="text/css" href="styles.css" />

    <script type="text/javascript" src="contentslider.js" />

</head>
<body>

    <script type="text/javascript">

featuredcontentslider.init({
	id: "slider1",  //id of main slider DIV
	contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
	toc: "#increment",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
	nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
	revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
	enablefade: [true, 0.2],  //[true/false, fadedegree]
	autorotate: [true, 3000],  //[true/false, pausetime]
	onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
		//previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
		//curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
	}
})

    </script>

    <br />
    <!--Inner content DIVs should always carry "contentdiv" CSS class-->
    <!--Pagination DIV should always carry "paginate-SLIDERID" CSS class-->
    <div id="slider2" class="sliderwrapper">
        <%--<div class="contentdiv">
Content 1 Here11111111111.
</div>

<div class="contentdiv">
Content 2 Here22222222222. <br />
<p></p><a href="javascript:featuredcontentslider.jumpTo('slider2', 1)">Go back to 1st slide</a>
</div>

<div class="contentdiv">
Content 3 Here2223333333333.
</div>--%>
        <div class="contentdiv">
            <a href="http://www.google.com/">
                <img style="border-style: none;" src="images/the-dark-knight.jpg" alt="The Dark Kight"
                    width="458px" height="279px" /></a>
        </div>
        <div class="contentdiv">
            <a href="http://www.google.com/">
                <img style="border-style: none;" src="images/walle-movie-poster.jpg" alt="Wall E Movie"
                    width="458px" height="279px" /></a>
        </div>
        <div class="contentdiv">
            <a href="http://www.google.com/">
                <img style="border-style: none;" src="images/quantum-of-solace.jpg" alt="Quantum of Solace"
                    width="458px" height="279px" /></a>
        </div>
    </div>
    <div id="paginate-slider2" class="pagination">
        <a href="#" class="toc">1</a> <a href="#" class="toc anotherclass">2</a> <a href="#"
            class="toc">3</a> <a href="#" class="prev" style="margin-left: 10px"><</a> <a href="#"
                class="next">></a>
    </div>

    <script type="text/javascript">

featuredcontentslider.init({
	id: "slider2",  //id of main slider DIV
	contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
	toc: "markup",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
	nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
	revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
	enablefade: [true, 0.2],  //[true/false, fadedegree]
	autorotate: [true, 3000],  //[true/false, pausetime]
	onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
		//previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
		//curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
	}
})

    </script>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
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
            </tr>
        </table>
    </form>
</body>
</html>
