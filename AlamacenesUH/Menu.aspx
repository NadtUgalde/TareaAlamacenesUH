<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="AlmacenesUH.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/x-icon" href="imagenes/favicon.ico" />
    <link href="Css/menu.css" rel="stylesheet" />
    <title>Menu</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navMenu">
                <a href="FrmClientes.aspx">Clientes</a>
                <a href="FrmOrdenes.aspx">Ordenes</a>
                <a href="FrmProductos.aspx">Productos</a>
                <a href="FrmDetallesOrdenes.aspx">Detalles</a>
                <div class="dot"></div>
            </nav>
        </div>
    </form>
</body>
</html>
