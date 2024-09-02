package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Cuota;
import entidad.Prestamo;
import exceptions.sqlPagoPrestamosException;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.CuotaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

@WebServlet("/ServletPagoPrestamos")
public class ServletPagoPrestamos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrestamoNegocioImpl prestamoNegocioImpl = new PrestamoNegocioImpl();
	private CuotaNegocioImpl cuotaNegocioImpl = new CuotaNegocioImpl();
	private ArrayList<Cuota> listaCuotas = new ArrayList<Cuota>();
	private CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
	private ArrayList<Cuenta> cuentasPorCliente = new ArrayList<Cuenta>();
	private ArrayList<Prestamo> listaPrestamos= new ArrayList<Prestamo>(); 
  
    public ServletPagoPrestamos() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();      	
		if(request.getParameter("btnPagoDePrestamos")!=null) {
			
			int cantCuentas = (int) session.getAttribute("cantCuentas");
			if(cantCuentas !=0) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("/PagoPrestamosCliente.jsp");
				dispatcher.forward(request, response);	
			}else {
				session.setAttribute("respuesta", "No tiene cuentas disponibles para acceder a esta opción.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/MenuCliente.jsp");
				dispatcher.forward(request, response);		
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
