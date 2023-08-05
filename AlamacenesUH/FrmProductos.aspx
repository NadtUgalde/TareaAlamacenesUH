<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmProductos.aspx.cs" Inherits="AlmacenesUH.FrmProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/EstiloCatalogo.css" rel="stylesheet" />
    <link href="Css/CssBotones.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Productos</title>
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
                <label for="Producto">Producto:</label>
                <asp:TextBox ID="tproducto" runat="server" ></asp:TextBox>
            </div>
            <div>
                <label for="Nombre">Nombre:</label>
                <asp:TextBox ID="tnombre" runat="server" requiered ></asp:TextBox>
            </div>
            <div>
                <label for="Precio">Precio:</label>
                <asp:TextBox ID="tprecio" runat="server"></asp:TextBox>
            </div>
            

            <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" Width="120px" />
            <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" Width="120px" />
            <%--<asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" Width="134px" />--%>


            <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" Width="133px" />


        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Productos</h2>
            <table  id="productosListTable">
                <thead cssclass ="table" >
                    <tr>
                        <th class="auto-style1">Id Producto</th>
                        <th class="auto-style1">Nombre</th>
                        <th class="auto-style1">Precio</th>
                      </tr>
                    <asp:Repeater runat="server" ID="repeaterproductos">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("Nombre") %></td>
                                <td><%# Eval("Precio") %></td>
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
