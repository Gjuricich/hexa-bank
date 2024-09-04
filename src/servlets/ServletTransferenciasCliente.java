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

@WebServlet("/ServletTransferenciasCliente")
public class ServletTransferenciasCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
	 private ArrayList<Cuenta> cuentasPorCliente;
     private TransferenciaNegocioImpl tNegocio = new TransferenciaNegocioImpl();
       

    public ServletTransferenciasCliente() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    Cliente cliente = (Cliente)session.getAttribute("cliente");
		
		if(request.getParameter("btnTransferencias")!=null){
			
			int cantCuentas = (int) session.getAttribute("cantCuentas");
			if(cantCuentas !=0) {
			 	RequestDispatcher dispatcher = request.getRequestDispatcher("/TransferenciasCliente.jsp");
				dispatcher.forward(request, response);
			}else {
				session.setAttribute("respuesta", "No tiene cuentas disponibles para acceder a esta opci�n.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/MenuCliente.jsp");
				dispatcher.forward(request, response);		
			}
  
	    }
		
		if(request.getParameter("btnTransferencias1")!=null){
			cargarCuentas(request,cliente);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/TransferenciasCDT.jsp");
			dispatcher.forward(request, response);
	    }
		
		
		if(request.getParameter("btnTransferencias2")!=null){	 
			cargarCuentas(request,cliente);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/TransferenciasCP.jsp");
			dispatcher.forward(request, response);
	    }
				
	}


     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 HttpSession session = request.getSession(); 
		 Cliente cliente = (Cliente)session.getAttribute("cliente");

         if(request.getParameter("btnTransferir")!=null)
 	    {	    		
 			if(!transferirMismaCuenta(request)){
 			String cbuOrigen = request.getParameter("CuentaOrigen");
 			String cbuDestino = request.getParameter("CuentaDestino");
 			String detalle =request.getParameter("detalleTransferencia");
 			String aux = request.getParameter("importe");
	        BigDecimal importe = new BigDecimal(aux);
	        Boolean inserto=tNegocio.insert(cbuOrigen, cbuDestino,detalle,importe);
		        if(inserto) {
		        	
		        	session.setAttribute("respuesta", "Transferencia exitosa");
		        }
		        else {
		        	session.setAttribute("respuesta", "Error. La transferencia no pudo realizarse. Saldo insuficiente en la cuenta de origen.");
		        }
 			}
	        cargarCuentas(request,cliente);
 			RequestDispatcher dispatcher = request.getRequestDispatcher("/TransferenciasCP.jsp");
 			dispatcher.forward(request, response);
 	    }
 		
	
         
	 
         
    }
     
     
     
  
   



}
