using AlmacenesUH.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmacenesUH.Clases
{
    public class ClsUsuario
    {
		//Atributos con sus respectivos metodos de get y set.
        private string usuario; 
		public  string Usuarios
		{
			get { return usuario; }
			set { usuario = value; }
		}
		private string clave;
		public string Clave 
		{ 
			get { return clave; }
			set { clave = value; } 
		}
		public static int ConsultarUsuario(string usuario, string clave) //Funcion que establece la conexion con la base de datos. Y recopila los datos.
		{
			int retorno = 0;
			SqlConnection Conn = new SqlConnection();
			try
			{
				using (Conn = DBconn.obtenerConexion())
				{
                    SqlCommand cmd = new SqlCommand("ValidarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@usuario", usuario));
                    cmd.Parameters.Add(new SqlParameter("@clave", clave));

                    retorno = cmd.ExecuteNonQuery();
					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						if (reader.Read())
						{
							retorno = 1;
						}
					}
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
				return 0;
            }
            finally
            {
                Conn.Close();
				Conn.Dispose();
            }
			return retorno;
		}

	}
}