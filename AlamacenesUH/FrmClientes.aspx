<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmClientes.aspx.cs" Inherits="AlamacenesUH.FrmClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/EstiloCatalogo.css" rel="stylesheet" />
    <link href="Css/CssBotones.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <form cssclass="contenedor" id="form1" runat="server">
        <div>
            <div>
                <label for="Codigo">Codigo:</label>
                <asp:TextBox ID="tcodigo" runat="server" requiered></asp:TextBox>
            </div>
            <div>
                <label for="Nombre">Nombre Cliente:</label>
                <asp:TextBox ID="tnombre" runat="server" OnTextChanged="tnombre_TextChanged"></asp:TextBox>
            </div>
            <div>
                <label for="Direccion">Direccion:</label>
                <asp:TextBox ID="tdireccion" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Telefono">Telefono:</label>
                <asp:TextBox ID="ttelefono" runat="server"></asp:TextBox>
            </div>


            <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" Width="120px" />
            <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" Width="120px" />
            <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" Width="133px" />
            <asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" Width="134px" />


        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Clientes</h2>
            <table  id="clientListTable">
                <thead cssclass ="table" >
                    <tr>
                        <th class="auto-style1">Codigo</th>
                        <th class="auto-style1">Nombre</th>
                        <th class="auto-style1">Direccion</th>
                        <th class="auto-style1">Telefono</th>
                    </tr>
                    <asp:Repeater runat="server" ID="repeaterClientes">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("Nombre") %></td>
                                <td><%# Eval("Direccion") %></td>
                                <td><%# Eval("Telefono") %></td>


<%--                                 <td>
                                        
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" CommandArgument='<%# Eval("Codigo") %>' />
                                        <asp:Button ID="btnBorrar" runat="server" Text="Borrar" OnClick="btnBorrar_Click" CommandArgument='<%# Eval("Codigo") %>' />
                                    </td>--%>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </thead>
            </table>
        </div>
        </form>
        <footer><div class="footer"> Copyright &copy; Valeria Ugalde- Todos los derechos 2023
        <a class="footerimg" href="#form1"><img src="Imagenes/arriba.png" /></a></div> </footer>
        
    </body>
</html>
