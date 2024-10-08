<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
 String usuario = null;
 String tipoUsuario = null;
if (session != null && session.getAttribute("usuario") != null && session.getAttribute("tipoUsuario") != null) {
	usuario = (String) session.getAttribute("usuario");
	tipoUsuario = (String) session.getAttribute("tipoUsuario");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
       <link rel="icon" type="image/png" href="Images/logo.png">
       <title>Men� de cliente</title>
    <style>
    
        .content-background {
            background: url('Images/fondo3.png') no-repeat center center fixed;
            background-size: 100%;
        }
        .menu-container {
            background: rgba(243, 244, 246, 0.9); 
            padding: 2rem;
            border-radius: 0.5rem;
        } 
        .button-container div {
            margin-bottom: 1rem; /
        }
        .button-container button {
            width: 100%;
        }
    </style>
</head>
<body>

    <jsp:include page="NavBar.jsp" />
          <%   
	  String respuesta = null;
	    if(session != null && session.getAttribute("respuesta") != null){
	    respuesta = (String)session.getAttribute("respuesta");
	    session.removeAttribute("respuesta");
	     %>
	    <script> 
	        alert('<%= respuesta%>');
	    </script>   
	    <%
	    respuesta = null;}
    %>
    
    
 <div class="bg-white pt-23">
    
    
     
   <div class="content-background min-h-screen flex items-center justify-center">
        <section class="text-gray-600 body-font min-h-screen flex items-center justify-center w-full">
            <div class="container px-5 py-24 mx-auto flex flex-col items-center">
                <div class="menu-container w-full md:w-1/2 lg:w-1/3">
                <h1 class="title-font font-medium text-3xl text-gray-900 text-center">Hola <%=usuario %> !</h1>
                <br>
                 <p class="leading-relaxed mt-4 text-center">Bienvenido/a al men� clientes de HexaBank</p>
                 <br>
                <div class="button-container space-y-4">
                    <form action="ServletCliente" method="get"> 
                    <div>
                        <button type="submit" name="btnPerfil" value="true" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg"">Perfil</button>
                    </div>
                    <div>
                        <button type="submit" name="btnCuentas" value="true" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Cuentas</button>
                    </div>
                     </form>
                    <form action="ServletTransferenciasCliente" method="get"> 
                    <div>
                        <button type="submit" name="btnTransferencias" value="true" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg"">Transferencias</button>
                    </div>
                    </form>
                    
                     <form action="ServletAdminPrestamos" method="get">
                    <div>
                        <button type="submit" name="btnSolicitarPrestamos" value="true" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Solicitar pr�stamo</button>
                    </div>
                    </form>
                    <form action="ServletPagoPrestamos" method="get">
                     <div>
                        <button type="submit" name="btnPagoDePrestamos" value="true" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Pago de pr�stamos</button>
                    </div>
                     </form>
                     
                </div>
            </div>
        </div>
    </section>
     </div>
       </div>
     <jsp:include page="Footer.jsp" />
</body>
</html>

