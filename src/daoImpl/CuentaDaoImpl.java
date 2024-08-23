package daoImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.Localidad;
import entidad.Usuario;
import dao.ClienteDao;
import dao.CuentaDao;
import daoImpl.UsuarioDaoImpl;
import daoImpl.LocalidadDaoImpl;

public class CuentaDaoImpl implements CuentaDao {
	
	private static final String list = "SELECT c.*, t.tipo_cuenta FROM cuentas c JOIN tiposcuentas t ON c.id_tipoCuenta = t.id_tipoCuenta WHERE c.estado = 1";	    
	
	@Override
	public ArrayList<Cuenta> list() {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    ArrayList<Cuenta> list_cuentas = new ArrayList<Cuenta>();
	    try {
	        Connection conexion = Conexion.getConexion().getSQLConexion();
	        Statement statement = conexion.createStatement();
	        ResultSet result_set = statement.executeQuery(list);
	        while(result_set.next()) {
	            ClienteDaoImpl clienteDaoImpl = new ClienteDaoImpl();
	            Cliente cliente = clienteDaoImpl.get(result_set.getString("dni"));
	            
	            list_cuentas.add(
	                new Cuenta(
	                    cliente,
	                    result_set.getDate("fecha_creacion"),
	                    result_set.getString("tipo_cuenta"),
	                    result_set.getInt("numero_cuenta"),
	                    result_set.getString("cbu"),
	                    result_set.getBigDecimal("saldo"),
	                    result_set.getBoolean("estado")
	                )
	            );
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list_cuentas;
	}
	
	
}
