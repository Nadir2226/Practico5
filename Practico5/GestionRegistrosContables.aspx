<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionRegistrosContables.aspx.cs" Inherits="Practico5.GestionRegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id" Height="16px" Width="148px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Monto"></asp:TextBox>
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem Value="false">Debe</asp:ListItem>
                <asp:ListItem Value="true">Haber</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="descripcion" DataValueField="id" Height="29px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="340px">
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Eliminar" />
            <br />
            <br />
            <asp:Table ID="Table1" runat="server" Height="16px" Width="479px">
            </asp:Table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CONEXION %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CONEXION %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                <asp:ControlParameter ControlID="DropDownList3" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CONEXION %>" SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CONEXION %>" SelectCommand="SELECT * FROM [RegistrosContables] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
