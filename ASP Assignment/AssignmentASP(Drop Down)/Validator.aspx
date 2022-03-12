<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validator.aspx.cs" Inherits="AssignmentASP.Validator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
    <body>
    <form id="form1" runat="server">
    Select Mobile Of Your Choice : <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="88px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList><br /><br/><br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Image ID="Image1" runat="server" Height="450px" Width="550px" /><br /><br /><br />
     <asp:Button ID="Button1" runat="server" Text="Cost" Height="35px" Width="50px" OnClick="Button1_Click" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Label ID="Label1" runat="server" Text="Cost of the Item"></asp:Label>
     &nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
</form>
     
    
</body>
</html>
