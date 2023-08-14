<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmOrdenes.aspx.cs" Inherits="AlmacenesUH.FrmOrdenes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Css/EstiloCatalogo.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="imagenes/favicon.ico"/>
    <link href="Css/CssBotones.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ordenes</title>
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
                <label for="Orden">Orden:</label>
                <asp:TextBox ID="torden" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Cliente">ID Cliente:</label>
                <asp:TextBox ID="tcliente" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Fecha">Fecha:</label>
                <asp:TextBox ID="tfecha" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="Total">Total:</label>
                <asp:TextBox ID="ttotal" runat="server"></asp:TextBox>
            </div>
            <div class="button-container">
                <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
                <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
                <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" />
                <asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" />
            </div>
        </div>

        <div cssclass="rigth">
            <h2 align="center">Lista de Ordenes</h2>
            <table id="ordenesListTable" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
                <thead cssclass="table">
                    <tr>
                        <th class="auto-style2">Id Ordenes</th>
                        <th class="auto-style2">Id Clientes</th>
                        <th class="auto-style2">Fecha</th>
                        <th class="auto-style2">Total</th>
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
</body>
</html>
