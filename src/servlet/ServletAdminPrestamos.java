package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Prestamo;
import entidad.TipoPrestamo;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;
import negocioImpl.TipoPrestamoNegocioImpl;

@WebServlet("/ServletAdminPrestamos")
public class ServletAdminPrestamos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TipoPrestamoNegocioImpl tipoPrestamoImpl = new TipoPrestamoNegocioImpl();
	private PrestamoNegocioImpl prestamoImpl = new PrestamoNegocioImpl();
	private ArrayList<TipoPrestamo> listaTipoPrestamos = new ArrayList<TipoPrestamo>();
	private ArrayList<Prestamo> listaPrestamos = new ArrayList<Prestamo>();
	TipoPrestamo tipoPrestamoS = new TipoPrestamo();
	
	private CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
	private ArrayList<Cuenta> cuentasPorCliente = new ArrayList<Cuenta>();

    public ServletAdminPrestamos() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		int cuotasSeleccionadas =12;
        BigDecimal montoSeleccionado = new BigDecimal("500000.00");
        TipoPrestamo auxTipoPrestamo = tipoPrestamoImpl.get(cuotasSeleccionadas, montoSeleccionado);

      
       

        request.setAttribute("Monto", auxTipoPrestamo.getImporteTotal());
        request.setAttribute("Cuotas", auxTipoPrestamo.getNroCuotas());
        request.setAttribute("interes", auxTipoPrestamo.getInteresAnual());
        request.setAttribute("valorCuota", auxTipoPrestamo.getCuotaMensual());
        request.setAttribute("montoFinal", auxTipoPrestamo.getImporteIntereses());
        request.setAttribute("Lista_Cuentas_cliente", cuentasPorCliente);
        
        
		if(request.getParameter("btnPrestamos") != null)
	    {
			
			listaPrestamos = prestamoImpl.list();
	        request.setAttribute("Lista_Prestamos", listaPrestamos);
	        
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarSolicitudesPrestamos.jsp");
			dispatcher.forward(request, response);
	    }
		
		if(request.getParameter("btnSolicitarPrestamos") != null)
	    {
		
			
			int cantCuentas = (int) session.getAttribute("cantCuentas");
			if(cantCuentas !=0) {
				Cliente cliente = (Cliente)session.getAttribute("cliente");
				cuentasPorCliente = cuentaNegocioImpl.listCuentasPorCliente(cliente.getDni());
			    request.setAttribute("Lista_Cuentas_cliente", cuentasPorCliente);
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("/SolicitarPrestamo.jsp");
				dispatcher.forward(request, response);
			}else {
				session.setAttribute("respuesta", "No tiene cuentas disponibles para acceder a esta opci�n.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/MenuCliente.jsp");
				dispatcher.forward(request, response);		
			}
	    }
		
     }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
