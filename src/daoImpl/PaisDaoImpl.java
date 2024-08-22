package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entidad.Pais;
import dao.PaisDao;

public class PaisDaoImpl  implements PaisDao {

	private static final String list = "SELECT * FROM paises";
	
	@Override
	public ArrayList<Pais> list() {
		try 
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch (ClassNotFoundException e){
    		e.printStackTrace();
    	}
		ArrayList<Pais> list_paises = new ArrayList<Pais>();
		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement statement = conexion.createStatement();
			ResultSet result_set = statement.executeQuery(list);
			while(result_set.next()) {
				String nombre_pais = result_set.getString("nombre");
				int paisId = result_set.getInt("pais_id");
				Pais pais = new Pais(paisId,nombre_pais);
				list_paises.add(pais);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list_paises;
	}
	
}
