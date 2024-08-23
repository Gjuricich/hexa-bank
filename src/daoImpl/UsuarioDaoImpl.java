package daoImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidad.TipoUsuario;
import entidad.Usuario;
import dao.UsuarioDao;
import daoImpl.Conexion;


public class UsuarioDaoImpl implements UsuarioDao {

	private static final String update = "UPDATE usuarios SET nombre_usuario = ?, password = ?,tipo_usuario_id = ? WHERE usuario_id = ?";
	private static final String insert = "INSERT INTO usuarios(nombre_usuario, password, tipo_usuario_id) VALUES(?, ?, ?)";	
	
	@Override
	public boolean insert(Usuario usuario) {
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
		        statement.setString(1, usuario.getNombreUsuario());
		        statement.setString(2,usuario.getPassword());
		        statement.setInt(3,usuario.getTipoUsuario().getTipoUsuarioId());     
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
	public boolean update(Usuario usuario) {
		try 
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch (ClassNotFoundException e){
    		e.printStackTrace();
    	}
		
		    PreparedStatement statement;
	        Connection conexion = Conexion.getConexion().getSQLConexion();
	        boolean isUpdateExitoso = false;
	        try {
	        	statement = conexion.prepareStatement(update);
		        statement.setString(1, usuario.getNombreUsuario());
		        statement.setString(2,usuario.getPassword());
		        statement.setInt(3,usuario.getTipoUsuario().getTipoUsuarioId());
		        statement.setInt(4,usuario.getUsuarioId());
	            
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
