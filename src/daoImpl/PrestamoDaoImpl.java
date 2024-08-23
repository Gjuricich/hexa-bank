package daoImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.CallableStatement;

import dao.PrestamoDao;
import entidad.Prestamo;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.TipoPrestamo;

public class PrestamoDaoImpl implements PrestamoDao {
    private static final String insert = "INSERT INTO prestamos(numero_cuenta, fecha, plazo_pago, tipo_prestamo_id, estado_prestamo) VALUES(?, ?, ?, ?, ?)";  
    
    @Override
    public boolean insert(Prestamo prestamo) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isInsertExitoso = false;
        try {
            statement = conexion.prepareStatement(insert);
            statement.setInt(1, prestamo.getCuenta().getNumeroCuenta());
            statement.setDate(2, prestamo.getFecha());
            statement.setInt(3, prestamo.getPlazoPago());
            statement.setInt(4, prestamo.getTipoPrestamo().getTipoPrestamoId());
            statement.setString(5, "En proceso");

            if (statement.executeUpdate() > 0) {
                conexion.commit();
                isInsertExitoso = true;
            }
        } catch (SQLException e) {
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