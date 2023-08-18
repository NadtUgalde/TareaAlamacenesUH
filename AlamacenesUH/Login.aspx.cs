using AlmacenesUH.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmacenesUH
{
    public partial class LoginU : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void alertas(string texto) //Metodo script que crea una alerta en caso de que el usuario digite datos incorrectos.
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        protected void bingresar_Click(object sender, EventArgs e) //metodo para el boton de iniciar sesion
        {
            if (ClsUsuario.ConsultarUsuario(tusuario.Text, tclave.Text) > 0) //Si el valor que retorna la clase usuario es 1 entonces redirige a la ventana que se selecciono.
            {
                Response.Redirect("Menu.aspx");
            }
            else
            {
                alertas("USUARIO NO EXISTE :)"); //Mensaje de alerta.
            }
        }
    }
}