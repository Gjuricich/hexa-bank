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
	private static final String listPorDni = "SELECT c.*, t.tipo_cuenta FROM cuentas c JOIN tiposcuentas t ON c.id_tipoCuenta = t.id_tipoCuenta WHERE c.estado = 1 and c.dni = ?";	    
	private static final String insert = "INSERT INTO cuentas(id_tipoCuenta, cbu, dni, fecha_creacion) VALUES((SELECT id_tipoCuenta FROM tiposcuentas WHERE tipo_cuenta = ?), ?, ?, CURDATE())";	    
	

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
	
	@Override
	public ArrayList<Cuenta> listCuentasPorCliente(String dni) {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    ArrayList<Cuenta> list_cuentas = new ArrayList<Cuenta>();
	    try {
	        Connection conexion = Conexion.getConexion().getSQLConexion();
	        PreparedStatement statement = conexion.prepareStatement(listPorDni);
	        statement.setString(1, dni);
	        ResultSet result_set = statement.executeQuery();
	        
	        while (result_set.next()) {
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
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list_cuentas;

	}

	
	@Override
	public boolean insert(Cuenta cuenta_a_agregar) {
		try 
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch (ClassNotFoundException e){
    		e.printStackTrace();
    	}

		PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    boolean isInsertExitoso = false;
	    try
	    {
	    
	        statement = conexion.prepareStatement(insert);
	        
	        statement.setString(1, String.valueOf(cuenta_a_agregar.getTipoCuenta()));
	        statement.setString(2,cuenta_a_agregar.getCbu());
	        statement.setString(3,cuenta_a_agregar.getCliente().getDni());

	        
	        if(statement.executeUpdate() > 0)
	        {
	            conexion.commit();
	            isInsertExitoso = true;
	        }
	    } 
	    catch (SQLException e) 
	    {
	        e.printStackTrace();
	        try {
         	     conexion.rollback();

	            
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return isInsertExitoso;
	}


}
