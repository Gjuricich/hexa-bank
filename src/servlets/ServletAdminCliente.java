package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocioImpl.ClienteNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;
import negocioImpl.TipoUsuarioNegocioImpl;
import negocioImpl.PaisNegocioImpl;

import entidad.Cliente;
import entidad.Localidad;
import entidad.Pais;
import entidad.Provincia;
import entidad.TipoUsuario;
import entidad.Usuario;

import exceptions.matchLocacionException;
import exceptions.NumbersInTextException;

@WebServlet("/ServletAdminCliente")
public class ServletAdminCliente extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArrayList<Cliente> listaClientes1 = new ArrayList<Cliente>();
    private ArrayList<Localidad> listaLocalidad = new ArrayList<Localidad>();
    private ArrayList<Provincia> listaProvincia = new ArrayList<Provincia>();    
    private ArrayList<Pais> listaPais = new ArrayList<Pais>();

	private ClienteNegocioImpl clienteNegocioImpl = new ClienteNegocioImpl();
	private UsuarioNegocioImpl usuarioNegocioImpl = new UsuarioNegocioImpl();
	private LocalidadNegocioImpl localidadNegocioImpl = new LocalidadNegocioImpl();
	private ProvinciaNegocioImpl provinciaNegocioImpl = new ProvinciaNegocioImpl();
	private PaisNegocioImpl paisNegocioImpl = new PaisNegocioImpl();
	
    public ServletAdminCliente() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();  
    	
    	if(session == null || session.getAttribute("tipoUsuario") != "admin") {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
    		dispatcher.forward(request, response);
    	}
    	
    	
    	
    }
             
            

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();  
    	if(session == null || session.getAttribute("tipoUsuario") != "admin") {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
    		dispatcher.forward(request, response);
    	}
    	
    	
    }
    
    
    
}

