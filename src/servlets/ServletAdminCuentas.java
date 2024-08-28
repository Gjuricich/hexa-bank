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
import negocioImpl.*;

@WebServlet("/ServletAdminCuentas")
public class ServletAdminCuentas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
	private ClienteNegocioImpl clienteNegocioImpl = new ClienteNegocioImpl();
	private ArrayList<Cuenta> listaCuentas = new ArrayList<Cuenta>();
       

    public ServletAdminCuentas() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		

		if(request.getParameter("btnAdminCuentas")!=null)
	    {
			listaCuentas = cuentaNegocioImpl.list();
            request.setAttribute("Lista_Cuentas", listaCuentas);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarCuentas.jsp");
			dispatcher.forward(request, response);
	    }
		
		if(request.getParameter("btnModificar")!=null)
	    {
		    String auxNro = request.getParameter("nroCuenta");
		    int nroCuenta = Integer.parseInt(auxNro);
            Cuenta auxCuenta = listaCuentas.stream().filter(x -> (x.getNumeroCuenta()) == nroCuenta).findFirst().orElse(null);
            request.setAttribute("cuenta", auxCuenta);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarCuenta.jsp");
			dispatcher.forward(request, response);
	    }
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
	    if (request.getParameter("btnModificarCuenta") != null) {
	        String aux = request.getParameter("saldo");
	        BigDecimal saldo = new BigDecimal(aux);
	        
	        if (saldo.compareTo(BigDecimal.ZERO) < 0) {
	            session.setAttribute("respuesta", "No se aceptan saldos negativos");
	            String auxNro = request.getParameter("nroCuenta");
	            int nroCuenta = Integer.parseInt(auxNro);
                Cuenta auxCuenta = listaCuentas.stream().filter(x -> (x.getNumeroCuenta()) == nroCuenta).findFirst().orElse(null);
                request.setAttribute("cuenta", auxCuenta);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarCuenta.jsp");
	            dispatcher.forward(request, response);
	            return;
	        }
	        
	        Boolean modificado = cuentaNegocioImpl.update(
	            Integer.parseInt(request.getParameter("nroCuenta")),
	            request.getParameter("tipoCuenta"),
	            saldo
	        );

	        if (modificado) {
	            session.setAttribute("respuesta","Los cambios fueron guardados con éxito");
	        } else {
	            session.setAttribute("respuesta","Error. Los cambios no han sido guardados");
	        }

	        listaCuentas = cuentaNegocioImpl.list();
	        request.setAttribute("Lista_Cuentas", listaCuentas);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarCuentas.jsp");
	        dispatcher.forward(request, response);
	    } 
	    
	    
	}

}
