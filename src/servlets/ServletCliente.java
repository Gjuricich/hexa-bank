package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Movimiento;
import negocioImpl.*;

@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
	 private ArrayList<Cuenta> cuentasPorCliente = new ArrayList<Cuenta>();
	private MovimientosNegocioImpl movimientosNegocioImpl = new MovimientosNegocioImpl();
       

    public ServletCliente() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession();
		
		  if(request.getParameter("btnPerfil")!=null)
		    {
				
				Cliente clientePerfil = (Cliente)session.getAttribute("cliente");
		        request.setAttribute("Cliente_Perfil", clientePerfil);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/PerfilCliente.jsp");
				dispatcher.forward(request, response);	
		    }
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
             
		 }
	

}
