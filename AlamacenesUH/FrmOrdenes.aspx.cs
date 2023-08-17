using AlmacenesUH.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlamacenesUH
{
    public partial class FrmOrdene : System.Web.UI.Page
    {
        List<ClsOrden> ordenes = ClsOrden.ObtenerOrdenes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarOrdenes();
            }
            else
            {

            }


        }

        private void LimpiarTabla()
        {
            ordenes.Clear();
            repeaterordenes.DataSource = null;
            repeaterordenes.DataBind();
        }

        private void CargarOrdenes()
        {
            LimpiarTabla();
            ordenes = ClsOrden.ObtenerOrdenes();
            repeaterordenes.DataSource = ordenes;
            repeaterordenes.DataBind();
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

            tfecha.Text = string.Empty;
            ttotal.Text = string.Empty;
        }
        protected void BAgregar_Click(object sender, EventArgs e)
        {
            int resultado = ClsOrden.AgregarOrdenes(tcliente.Text, tfecha.Text, ttotal.Text);

            if (resultado > 0)
            {
                alertas("Orden ha sido ingresado con exito");
                LimpiarCampos();
                CargarOrdenes();
            }
            else
            {
                alertas("Error al ingresar Orden");
            }


        }

        protected void BBorrar_Click(object sender, EventArgs e)

        {
            String orden = torden.Text.Trim();
            int resultado = ClsOrden.BorrarOrdenes(orden);

            if (resultado > 0)
            {
                alertas("Orden ha sido borrado con exito");
                LimpiarCampos();
                CargarOrdenes();
            }
            else
            {
                alertas("Error al ingresar Orden");
            }
        }

        protected void BModificar_Click(object sender, EventArgs e)
        {
            String orden = torden.Text;
            String cliente = tcliente.Text;
            String fecha = tfecha.Text;
            String total = ttotal.Text;
            int resultado = ClsOrden.ModificarOrdenes(orden, cliente, fecha, total);

            if (resultado > 0)
            {
                alertas("Orden ha sido modificada con exito");
                LimpiarCampos();
                CargarOrdenes();
            }
            else
            {
                alertas("Error al ingresar Orden");
            }
        }
    }
}