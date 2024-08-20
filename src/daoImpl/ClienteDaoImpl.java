package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.CallableStatement;

import java.sql.Date;
import entidad.Cliente;
import entidad.Localidad;
import entidad.Usuario;
import dao.ClienteDao;
import daoImpl.UsuarioDaoImpl;
import daoImpl.LocalidadDaoImpl;

public class ClienteDaoImpl implements ClienteDao {
    
        private static final String update = "UPDATE clientes SET cuil = ? , nombre = ?, apellido = ?, sexo = ?, nacionalidad = ?, fecha_nacimiento = ?, direccion = ?, localidad_id = ?, provincia_id = ?, correo_electronico = ?, telefono = ? WHERE dni = ?";
	private static final String insert = "INSERT INTO clientes(dni, cuil, nombre ,apellido ,sexo ,nacionalidad ,fecha_nacimiento ,direccion ,localidad_id ,correo_electronico ,telefono ,usuario_id ,provincia_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";	
        private static final String delete = "CALL SP_BAJA_CLIENTE(?,?);";
        private static final String prestamosPorCliente= "SELECT COUNT(*) FROM prestamos as p INNER JOIN cuentas c ON p.numero_cuenta = c.numero_cuenta INNER JOIN clientes cl ON c.dni = cl.dni WHERE cl.dni = ? AND p.estado_prestamo <> 'Rechazado' AND p.estado = 'Vigente'";

	@Override
	public boolean insert(Cliente cliente) {
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
	        statement.setString(1, cliente.getDni());
	        statement.setString(2,cliente.getCuil());
	        statement.setString(3,cliente.getNombre());
	        statement.setString(4, cliente.getApellido());
	        statement.setString(5, String.valueOf(cliente.getSexo()));
	        statement.setString(6,cliente.getNacionalidad());
	        statement.setDate(7, cliente.getFechaNacimiento());
	        statement.setString(8, cliente.getDireccion());
	        statement.setInt(9, cliente.getLocalidad().getLocalidadId());
	        statement.setString(10,cliente.getCorreo());
	        statement.setString(11,cliente.getTelefono());
	        statement.setInt(12, cliente.getUsuario().getUsuarioId());
	        statement.setInt(13, cliente.getLocalidad().getProvincia().getProvinciaId());
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

        @Override
	public String delete(Cliente cliente) {
		try 
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch (ClassNotFoundException e){
    		e.printStackTrace();
    	}
		
		CallableStatement statement = null;
        Connection conexion = Conexion.getConexion().getSQLConexion();
	    String respuesta=null;

	    try {
	    	if (!prestamosPorCliente(cliente.getDni())) {
	        statement = (CallableStatement) conexion.prepareCall(delete);
	        statement.setString(1, cliente.getDni());
	        statement.setInt(2, cliente.getUsuario().getUsuarioId());
	        statement.execute();
            conexion.commit();
            respuesta = "El cliente con DNI: " + cliente.getDni() + " fue eliminado exitosamente";
       
        } else {
            respuesta = "El cliente tiene préstamos vigentes y no puede darse de baja.";
        }
	    } catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
                respuesta = "El cliente con DNI: " + cliente.getDni() + " no se pudo eliminar";
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
	    return respuesta;
	}

        public boolean prestamosPorCliente(String dni) {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        return false;
	    }

	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    PreparedStatement statement;
	    boolean tienePrestamos = false;

	    try {
	        statement = conexion.prepareStatement(prestamosPorCliente);
	        statement.setString(1, dni);
	        ResultSet resultSet = statement.executeQuery();
	        
	        if (resultSet.next()) {
	            int prestamosActivos = resultSet.getInt(1);	            
	            tienePrestamos = prestamosActivos > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return tienePrestamos;
	}

        @Override
	public boolean update(Cliente cliente) {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	  
	    PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    boolean isUpdateExitoso = false;
	    try {
	        statement = conexion.prepareStatement(update);
	        statement.setString(1, cliente.getCuil());
	        statement.setString(2, cliente.getNombre());
	        statement.setString(3, cliente.getApellido());
	        statement.setString(4, String.valueOf(cliente.getSexo()));
	        statement.setString(5, cliente.getNacionalidad());
	        statement.setDate(6, (java.sql.Date) cliente.getFechaNacimiento());
	        statement.setString(7, cliente.getDireccion());
	        statement.setInt(8, cliente.getLocalidad().getLocalidadId());
	        statement.setInt(9, cliente.getLocalidad().getProvincia().getProvinciaId());
	        statement.setString(10, cliente.getCorreo());
	        statement.setString(11, cliente.getTelefono());
	        statement.setString(12, cliente.getDni());

	        if (statement.executeUpdate() > 0) {
	            conexion.commit();
	            isUpdateExitoso = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            conexion.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return isUpdateExitoso;
	}




	
}
