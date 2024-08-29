package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

import entidad.Prestamo;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;
import negocioImpl.TipoPrestamoNegocioImpl;

@WebServlet("/ServletReportes")
public class ServletReportes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TipoPrestamoNegocioImpl tipoPrestamoImpl = new TipoPrestamoNegocioImpl();
	private PrestamoNegocioImpl prestamoImpl = new PrestamoNegocioImpl();
	private ArrayList<Prestamo> listaTipoPrestamos = new ArrayList<Prestamo>();

    public ServletReportes() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("btnReportes")!=null) {
		    request.setAttribute("MostrarForm", "MostrarForm");
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/Reportes.jsp");
			dispatcher.forward(request, response);
	    }

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  
	    if(request.getParameter("btnAtras")!=null) {
	        request.setAttribute("MostrarForm", "MostrarForm");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/Reportes.jsp");
	        dispatcher.forward(request, response);
	        
	    } else if(request.getParameter("btnDescargar")!=null) {
	        String reporte = request.getParameter("reporte");
	        request.setAttribute("MostrarForm", "NoMostrarForm");
	        response.setContentType("text/plain");
	        response.setHeader("Content-Disposition", "attachment;filename=reporte.txt");

	        PrintWriter out = response.getWriter();
	        out.print(reporte);
	        out.flush();
	        out.close();
	        
	        return;
	    } 
	}
}
