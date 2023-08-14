<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmProductos.aspx.cs" Inherits="AlmacenesUH.FrmProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/EstiloCatalogo.css" rel="stylesheet" />
    <link href="Css/CssBotones.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="imagenes/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Productos</title>
    <style type="text/css">
        .auto-style2 {
            width: 400px;
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <form cssclass="contenedor" id="form1" runat="server">
        <div>
            <div>
                <label for="Producto">Producto:</label>
                <asp:TextBox ID="tproducto" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Nombre">Nombre:</label>
                <asp:TextBox ID="tnombre" runat="server" ></asp:TextBox>
            </div>
            <div>
                <label for="Precio">Precio:</label>
                <asp:TextBox ID="tprecio" runat="server"></asp:TextBox>
            </div>
            <div class="button-container">
                <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
                <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" />
                <asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" />
            </div>
        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Productos</h2>
            <table id="productosListTable" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
                <thead cssclass="table">
                    <tr>
                        <th class="auto-style2">Id Producto</th>
                        <th class="auto-style2">Nombre</th>
                        <th class="auto-style2">Precio</th>
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
</body>
</html>
