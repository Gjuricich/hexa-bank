package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.Cliente;
import entidad.Usuario;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;

@WebServlet("/ServletSesion")
public class ServletSesion extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClienteNegocioImpl clienteNegocioImpl = new ClienteNegocioImpl();

    public ServletSesion() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();  

        if(request.getParameter("btnIngresar") != null) {
            UsuarioNegocioImpl usuarioNegocioImpl = new UsuarioNegocioImpl();

            String nombreUsuario = request.getParameter("username");
            String password = request.getParameter("password");

        }

        if(request.getParameter("btnCerrarSesion") != null) {
            session.invalidate();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
