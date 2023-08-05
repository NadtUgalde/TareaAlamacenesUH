using AlmacenesUH.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmacenesUH
{
    public partial class FrmProductos : System.Web.UI.Page
    {
        List<ClsProducto> productos = ClsProducto.ObtenerProductos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
            else
            {

            }


        }

        private void LimpiarTabla()
        {
            productos.Clear();
            repeaterproductos.DataSource = null;
            repeaterproductos.DataBind();
        }

        private void CargarProductos()
        {
            LimpiarTabla();
            productos = ClsProducto.ObtenerProductos();
            repeaterproductos.DataSource = productos;
            repeaterproductos.DataBind();
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
            tproducto.Text = string.Empty;
            tnombre.Text = string.Empty;
            tprecio.Text = string.Empty;
        }
        protected void BAgregar_Click(object sender, EventArgs e)
        {
            int resultado = ClsProducto.AgregarProductos(tproducto.Text, tnombre.Text, tprecio.Text);

            if (resultado > 0)
            {
                alertas("Producto ha sido ingresado con éxito");
                LimpiarCampos();
                CargarProductos();
            }
            else
            {
                alertas("Error al ingresar producto");
            }


        }

        protected void BBorrar_Click(object sender, EventArgs e)

        {
            String producto = tproducto.Text.Trim();
            int resultado = ClsProducto.BorrarProductos(producto);

            if (resultado > 0)
            {
                alertas("Producto ha sido borrado con éxito");
                LimpiarCampos();
                CargarProductos();
            }
            else
            {
                alertas("Error al ingresar producto");
            }
        }

        protected void BModificar_Click(object sender, EventArgs e)
        {
            String producto = tproducto.Text;
            String nombre = tnombre.Text;
            String precio = tprecio.Text;
            int resultado = ClsProducto.ModificarProductos(producto, nombre, precio);

            if (resultado > 0)
            {
                alertas("Producto ha sido modificada con éxito");
                LimpiarCampos();
                CargarProductos();
            }
            else
            {
                alertas("Error al ingresar producto");
            }
        }

    }
}