using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace AlmacenesUH.Clases
{
    public class ClsDetalle
    {
        public int id { get; set; }
        public int orden { get; set; }
        public int producto { get; set; }
        public int cantidad { get; set; }

        private static int tipoOperacion = 0;

        public static List<ClsDetalle> detalles = new List<ClsDetalle>();
        public ClsDetalle(int id, int orden, int producto, int cantidad)
        {
            this.id = id;
            this.orden = orden;
            this.producto = producto;
            this.cantidad = cantidad;
        }

        public ClsDetalle()
        {

        }

        public static int AgregarDetalles(string id, string orden, string producto, string cantidad)
        {
            int retorno = 0;
            tipoOperacion = 1;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("sp_GestionarDetallesOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@id_detalle", id));
                    cmd.Parameters.Add(new SqlParameter("@id_orden", orden));
                    cmd.Parameters.Add(new SqlParameter("@id_producto", producto));
                    cmd.Parameters.Add(new SqlParameter("@cantidad", cantidad));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }


        public static int BorrarDetalles(string id)
        {
            int retorno = 0;
            tipoOperacion = 2;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("sp_GestionarDetallesOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@id_detalle", id));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }


        public static List<ClsDetalle> ObtenerDetalles()
        {
            int retorno = 0;
            tipoOperacion = 4;
            SqlConnection Conn = new SqlConnection();

            try
            {

                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("sp_GestionarDetallesOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ClsDetalle detalle = new ClsDetalle();
                            detalle.id = reader.GetInt32(0);
                            detalle.orden = reader.GetInt32(1);
                            detalle.producto = reader.GetInt32(2);
                            detalle.cantidad = reader.GetInt32(3);
                            detalles.Add(detalle);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return detalles;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return detalles;
        }

        public static int ModificarDetalles(string id, string orden, string producto, string cantidad)
        {
            int retorno = 0;
            tipoOperacion = 3;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("sp_GestionarDetallesOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@id_detalle", id));
                    cmd.Parameters.Add(new SqlParameter("@id_orden", orden));
                    cmd.Parameters.Add(new SqlParameter("@id_producto", producto));
                    cmd.Parameters.Add(new SqlParameter("@cantidad", cantidad));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
    }
}