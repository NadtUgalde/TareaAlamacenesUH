using AlmacenesUH.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmacenesUH
{
    public partial class FrmDetallesOrdenes : System.Web.UI.Page
    {
        List<ClsDetalle> detalles = ClsDetalle.ObtenerDetalles();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDetalles();
            }
            else
            {

            }


        }

        private void LimpiarTabla()
        {
            detalles.Clear();
            repeaterdetalles.DataSource = null;
            repeaterdetalles.DataBind();
        }

        private void CargarOrdenes()
        {
            LimpiarTabla();
            detalles = ClsDetalle.ObtenerDetalles();
            repeaterdetalles.DataSource = detalles;
            repeaterdetalles.DataBind();
        }

        public void alertas(String texto)
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

        public void LimpiarCampos()
        {
            tdetalle.Text = string.Empty;
            torden.Text = string.Empty;
            tproducto.Text = string.Empty;
            tcantidad.Text = string.Empty;
        }
        protected void BAgregar_Click(object sender, EventArgs e)
        {
            int resultado = ClsDetalle.AgregarDestalles(tdetalle.Text, torden.Text, tproducto.Text, tcantidad.Text);

            if (resultado > 0)
            {
                alertas("Detalle ha sido ingresado con éxito");
                LimpiarCampos();
                CargarDetalles();
            }
            else
            {
                alertas("Error al ingresar detalle");
            }


        }

        protected void BBorrar_Click(object sender, EventArgs e)

        {
            String detalle = tdetalle.Text.Trim();
            int resultado = ClsDetalle.BorrarDetalles(detalle);

            if (resultado > 0)
            {
                alertas("Detalle ha sido borrado con éxito");
                LimpiarCampos();
                CargarDetalles();
            }
            else
            {
                alertas("Error al ingresar detalle");
            }
        }

        protected void BModificar_Click(object sender, EventArgs e)
        {
            String detalle = tdetalle.Text;
            String orden = torden.Text;
            String producto = tproducto.Text;
            String cantidad = tcantidad.Text;
            int resultado = ClsDetalle.ModificarDetalles(detalle, orden, producto, cantidad);

            if (resultado > 0)
            {
                alertas("Detalle ha sido modificada con éxito");
                LimpiarCampos();
                CargarDetalles();
            }
            else
            {
                alertas("Error al ingresar detalle");
            }
        }

    }
}