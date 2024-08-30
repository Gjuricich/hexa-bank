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
        if (request.getParameter("btnAgregarCliente") != null) {
    		cargarDesplegables(request);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarCliente.jsp");
            dispatcher.forward(request, response);
            
        }else if (request.getParameter("btnAdminClientes") != null) {
			listaClientes1 = clienteNegocioImpl.list();
            request.setAttribute("Lista_Clientes", listaClientes1);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ClientesListar.jsp");
            dispatcher.forward(request, response);
            
        }else if (request.getParameter("btnDetalle") != null) {
            String dni = request.getParameter("dni");
            Cliente auxCliente = (Cliente)listaClientes1.stream().filter(x -> x.getDni().equals(dni)).findFirst().orElse(null);
            request.setAttribute("ClienteDetalle", auxCliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/DetalleCliente.jsp");
            dispatcher.forward(request, response);
        }else if (request.getParameter("btnModificar") != null) {
            String dni = request.getParameter("dni");
            Cliente auxCliente = clienteNegocioImpl.get(dni);
            request.setAttribute("ClienteDetalle", auxCliente);
            cargarDesplegables(request);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarCliente.jsp");
            dispatcher.forward(request, response);
            
        }else if(request.getParameter("btnEliminar") != null) {
        	String dni = request.getParameter("dni");
			String respuesta = clienteNegocioImpl.delete(clienteNegocioImpl.get(dni));
            session.setAttribute("respuesta", respuesta);
        	listaClientes1 = clienteNegocioImpl.list();
            request.setAttribute("Lista_Clientes", listaClientes1);   
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/ClientesListar.jsp");
        	dispatcher.forward(request, response);
        }    
    	
    	
    	
    }
             
            

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();  
    	if(session == null || session.getAttribute("tipoUsuario") != "admin") {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
    		dispatcher.forward(request, response);
    	}
        if(request.getParameter("btnGuardarCambios") != null) {
			try{
				//String dni = request.getParameter("dni");
				//Cliente auxCliente = (Cliente)listaClientes1.stream().filter(x -> x.getDni().equals(dni)).findFirst().orElse(null);
				
				Provincia provincia = provinciaNegocioImpl.get(Integer.parseInt(request.getParameter("provincia")));
				Localidad localidad = localidadNegocioImpl.get(Integer.parseInt(request.getParameter("localidad")));

				if(localidad.getProvincia().getProvinciaId() != provincia.getProvinciaId()){
					throw new matchLocacionException("La localidad no pertenece a la provincia seleccionada");
				}
				String regex = "[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+"; //Solo admite caracteres alfabeticos
				Pattern pattern = Pattern.compile(regex);
				Matcher matcher = pattern.matcher(request.getParameter("nombre"));
				if(!matcher.matches()) {
					throw new NumbersInTextException("El nombre debe contener exclusivamente caracteres alfabeticos");
				}

				Cliente modCliente = new Cliente(
            			request.getParameter("dni"),
            			request.getParameter("cuil"),
            			request.getParameter("nombre"),
            			request.getParameter("apellido"),
            			request.getParameter("sexo").charAt(0),
            			paisNegocioImpl.get(Integer.parseInt(request.getParameter("nacionalidad"))).getNombre(),
            			Date.valueOf(request.getParameter("fecha-nacimiento")),
            			request.getParameter("direccion"),
            			localidadNegocioImpl.get(Integer.parseInt(request.getParameter("localidad"))),
            			request.getParameter("Email"),
            			request.getParameter("telefonos"),
            			new Usuario()
            			);
            	
        		Boolean cli_modificado = clienteNegocioImpl.update(modCliente);       		
        		Cliente cliente = clienteNegocioImpl.get(request.getParameter("dni"));
        		Usuario modUser = usuarioNegocioImpl.get(cliente.getUsuario().getUsuarioId());
        		modUser.setPassword((String) request.getParameter("contrasena"));
        		Boolean user_modificado = usuarioNegocioImpl.update(modUser);        		
        		cliente.setUsuario(modUser);
        		
        		if(cli_modificado && user_modificado) {
        		session.setAttribute("respuesta", "Los cambios se guardaron exitosamente");
        		listaClientes1 = clienteNegocioImpl.list();
	            request.setAttribute("Lista_Clientes", listaClientes1);   
        		 RequestDispatcher dispatcher = request.getRequestDispatcher("/ClientesListar.jsp");
                dispatcher.forward(request, response);
        		}
			}catch(Exception e){
				session.setAttribute("respuesta", "Error al guardar los cambios: " + e.getMessage());
				listaClientes1 = clienteNegocioImpl.list();
	            request.setAttribute("Lista_Clientes", listaClientes1);   
        		RequestDispatcher dispatcher = request.getRequestDispatcher("/ClientesListar.jsp");
        		dispatcher.forward(request, response);
			}        	
         	
         }
    	
    	
    }
 
        private void cargarDesplegables(HttpServletRequest request) {
    	listaPais = paisNegocioImpl.list();    	
      	request.setAttribute("Lista_Paises", listaPais);
      	listaLocalidad = localidadNegocioImpl.list();
      	request.setAttribute("Lista_Localidades", listaLocalidad);
      	listaProvincia = provinciaNegocioImpl.list();
      	request.setAttribute("Lista_Provincias", listaProvincia);
	}
    
    
    
}

