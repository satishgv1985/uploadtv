<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manageTVs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage TV and Program</title>

    <script type="text/javascript">
    function FixGrid(idGrid)
    {
      // content looks like:

      //"<A href=\"javascript:__doPostBack('GridView1',

      //    'Edit$0')\">Edit</A> 

      // <A href=\"javascript:__doPostBack('GridView1',

      //    'Delete$0')\">Delete</A>"

      // replace Edit with Add, remove Delete
//debugger;
      var Parts = 
       idGrid.firstChild.childNodes[1].childNodes[0].innerHTML.split(">Edit<");
      var tmp = Parts.join(">Add<"); 
      Parts = tmp.split(">Delete<");
      idGrid.firstChild.childNodes[1].childNodes[0].innerHTML = 
                                        Parts.join("><");
    }
  
    
    
    </script>
<style type="text/css">
.heading
{
    font-weight:bold;
    text-decoration:underline;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <span class="heading">Manage TV's</span>
        <asp:GridView ID="gvTVs" runat="server" AutoGenerateColumns="False" DataKeyNames="i_tv_id"
            DataSourceID="SqlDataSourceTVs" AllowPaging="True" AllowSorting="True" CellPadding="4"
            PageSize="5" OnRowUpdating="gvTVs_RowUpdating">
            <Columns> <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="i_tv_id" HeaderText="Tv Id" InsertVisible="False" ReadOnly="True" />
                <asp:TemplateField HeaderText="TV Name" SortExpression="vch_tv_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbTVName" runat="server" Text='<%# Bind("vch_tv_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbTVName"
                            ErrorMessage="TV Name is Required">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("vch_tv_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
            </Columns>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTVs" runat="server" ConnectionString="<%$ ConnectionStrings:uploadConnectionString %>"
            SelectCommand="SELECT '' as [i_tv_id], '' as [vch_tv_name] UNION SELECT [i_tv_id], [vch_tv_name] FROM [tv]"
            DeleteCommand="DELETE FROM tv WHERE (i_tv_id = @i_tv_id)" UpdateCommand="UPDATE tv SET vch_tv_name = @vch_tv_name WHERE (i_tv_id = @i_tv_id)"
            InsertCommand="INSERT INTO tv(vch_tv_name) VALUES (@vch_tv_name)" OnUpdating="SqlDataSourceTVs_Updating">
            <UpdateParameters>
                <asp:Parameter Name="@vch_tv_name" Type="string" />
                <asp:Parameter Name="@i_tv_id" Type="int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="@i_tv_id" Type="int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="vch_tv_name" Type="string" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ShowSummary="False" />
        <br />
        <br />
        <span class="heading">Manage Program's</span>
         <asp:GridView ID="gvPrograms" runat="server" AutoGenerateColumns="False" DataKeyNames="i_program_id"
            DataSourceID="SqlDataSourcePrograms" AllowPaging="True" AllowSorting="True" CellPadding="4"
            PageSize="5" OnRowUpdating="gvPrograms_RowUpdating" >
            <Columns> <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="i_program_id" HeaderText="Program Id" InsertVisible="False" ReadOnly="True" />
                <asp:TemplateField HeaderText="Program Name" SortExpression="vch_program_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbProgramName" runat="server" Text='<%# Bind("vch_program_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbProgramName"
                            ErrorMessage="Please Enter Program Name">Enter Program Name</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("vch_program_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
            </Columns>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <asp:Label ID="lblErrorMessage" runat="server" Visible="False" Text="eee"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSourcePrograms" runat="server" ConnectionString="<%$ ConnectionStrings:uploadConnectionString %>"
            SelectCommand="SELECT '' as [i_program_id], '' as [vch_program_name] UNION SELECT [i_program_id], [vch_program_name] FROM [program]"
            DeleteCommand="DELETE FROM program WHERE (i_program_id = @i_program_id)" UpdateCommand="UPDATE program SET vch_program_name = @vch_program_name WHERE (i_program_id = @i_program_id)"
            InsertCommand="INSERT INTO program(vch_program_name) VALUES (@vch_program_name)">
            <UpdateParameters>
                <asp:Parameter Name="@vch_program_name" Type="string" />
                <asp:Parameter Name="@i_program_id" Type="int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="@i_program_id" Type="int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="vch_program_name" Type="string" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>

    <script type="text/javascript">
            FixGrid(document.all.gvTVs);
            FixGrid(document.all.gvPrograms);
    </script>

    <asp:HyperLink ID="hlGoToAdmin" NavigateUrl="~/tvpage.aspx" runat="server">Go Back to Admin</asp:HyperLink>
</body>
</html>
