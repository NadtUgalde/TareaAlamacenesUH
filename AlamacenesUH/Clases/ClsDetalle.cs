﻿using System;
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

        public static List<ClsDetalle> ordenes = new List<ClsDetalle>();
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

        public static int AgregarOrdenes(string cliente, string fecha, string total)
        {
            int retorno = 0;
            tipoOperacion = 1;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_GestionarOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@id_orden", 0));
                    cmd.Parameters.Add(new SqlParameter("@id_cliente", cliente));
                    cmd.Parameters.Add(new SqlParameter("@fecha", fecha));
                    cmd.Parameters.Add(new SqlParameter("@total", total));

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


        public static int BorrarOrdenes(string id)
        {
            int retorno = 0;
            tipoOperacion = 2;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_GestionarOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@id_orden", id));


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


        public static List<ClsOrden> ObtenerOrdenes()
        {
            int retorno = 0;
            tipoOperacion = 4;
            SqlConnection Conn = new SqlConnection();

            try
            {

                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_GestionarOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ClsOrden orden = new ClsOrden();
                            orden.id = reader.GetInt32(0);
                            orden.cliente = reader.GetInt32(1);
                            orden.fecha = reader.GetDateTime(2);
                            orden.total = reader.GetDecimal(3);
                            ordenes.Add(orden);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return ordenes;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return ordenes;
        }

        public static int ModificarOrdenes(string id, string cliente, string fecha, string total)
        {
            int retorno = 0;
            tipoOperacion = 3;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_GestionarOrdenes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@id_orden", id));
                    cmd.Parameters.Add(new SqlParameter("@id_cliente", cliente));
                    cmd.Parameters.Add(new SqlParameter("@fecha", fecha));
                    cmd.Parameters.Add(new SqlParameter("@total", total));

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