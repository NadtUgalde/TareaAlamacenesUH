<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AlmacenesUH.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Css/Login.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="imagenes/favicon.ico"/>
    <title>UH - INICIAR SESION</title>
</head>
<body>
      <div class="login-box">
      <img src="imagenes/UH.jpg" class="avatar" alt="Avatar Image"/>
      <h1>Bienvenido al Almacen UH</h1>
          <form id="form1" runat="server">
        <!-- USUARIO INPUT -->
        <label for="username">USUARIO</label>
        <asp:TextBox ID="tusuario" class="login-box" placeholder="Ingrese su nombre de usuario" runat="server" CssClass="auto-style1"/>
        <!-- CONTRASEÑA INPUT -->
        <label for="password">CONTRASEÑA</label>
        <asp:TextBox ID="tclave" class="login-box" textmode ="Password" placeholder="Ingrese su contraseña" runat="server" CssClass="auto-style1"/>        
        <asp:Button ID="bingresar" Class ="login-box" runat="server" Text="Iniciar sesion" cssClass="auto-style1" OnClick="bingresar_Click" />
        <a href="#">¿No te acuerdas de tu contraseña?</a><br/>
        <a href="cuentaNueva.aspx">Crear cuenta nueva</a>
          </form>
    </div>
</body>
</html>
