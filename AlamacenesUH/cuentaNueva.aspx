<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cuentaNueva.aspx.cs" Inherits="AlmacenesUH.cuentaNueva" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Css/LoginDos.css" rel="stylesheet" />
     <link rel="icon" type="image/x-icon" href="Imagenes/favicon.ico"/>
    <title>REGISTRAR NUEVO USUARIO</title>
</head>
<body>
    <div class="login-box">
      <img src="Imagenes/UH.jpg" class="avatar" alt="Avatar Image"/>
      <h1>Crear cuenta nueva</h1>
      <form>
        <!-- USUARIO INPUT -->
        <label for="username">NOMBRE DE USUARIO</label>
        <input type="text" placeholder="Ingrese su nombre"/>
        <!-- CORREO INPUT -->
        <label for="username">CORREO ELECTRONICO</label>
        <input type="text" placeholder="Ingrese su correo"/>
        <!-- CONTRASEÑA INPUT -->
        <label for="password">CONTRASEÑA</label>
        <input type="password" placeholder="Ingrese su contraseña"/>
        <input type="submit" value="Crear cuenta nueva"/>
        <a href="Login.aspx">Regresar a la pestaña anterior</a>
      </form>
    </div>
</body>
</html>