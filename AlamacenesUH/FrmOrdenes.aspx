<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmOrdenes.aspx.cs" Inherits="AlmacenesUH.FrmOrdenes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/EstiloCatalogo.css" rel="stylesheet" />
    <link href="Css/CssBotones.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ordenes</title>
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
                <label for="Orden">Orden:</label>
                <asp:TextBox ID="torden" runat="server" ></asp:TextBox>
            </div>
            <div>
                <label for="Cliente">ID Cliente:</label>
                <asp:TextBox ID="tcliente" runat="server" requiered ></asp:TextBox>
            </div>
            <div>
                <label for="Fecha">Fecha:</label>
                <asp:TextBox ID="tfecha" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Total">Total:</label>
                <asp:TextBox ID="ttotal" runat="server"></asp:TextBox>
            </div>


            <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" Width="120px" />
            <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" Width="120px" />
            <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" Width="133px" />
            <%--<asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" Width="134px" />--%>


        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Ordenes</h2>
            <table  id="ordenesListTable">
                <thead cssclass ="table" >
                    <tr>
                        <th class="auto-style1">Id Ordenes</th>
                        <th class="auto-style1">Id Clientes</th>
                        <th class="auto-style1">Fecha</th>
                        <th class="auto-style1">Total</th>
                    </tr>
                    <asp:Repeater runat="server" ID="repeaterordenes">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("Cliente") %></td>
                                <td><%# Eval("Fecha") %></td>
                                <td><%# Eval("Total") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </thead>
            </table>
        </div>
        </form>
        <footer><div class="footer"> Copyright &copy; Valeria Ugalde y Bryan Leiva- Todos los derechos 2023
        <a class="footerimg" href="#form1"><img src="Imagenes/arriba.png" /></a></div> </footer>
        
    </body>
</html>