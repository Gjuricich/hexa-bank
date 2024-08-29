<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entidad.Cliente" %>
<%
		  Cliente auxCliente = new Cliente();  
          auxCliente = (Cliente) request.getAttribute("ClienteDetalle");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>  
        .bgLeft {
           background: linear-gradient(45deg, mediumslateblue,  blueviolet, darkviolet, darkviolet,blueviolet, mediumslateblue);
            background-size: cover;           
        }
        .bgRight {
            background: linear-gradient(45deg, mediumslateblue,  blueviolet, darkviolet, darkviolet,blueviolet, mediumslateblue);
            background-size: cover;
        }
    </style>
</head>

 <body>
<jsp:include page="NavBar.jsp"/>

<div class="flex">
 <div class="w-1/12 bgLeft"></div>
   <div class="w-10/12 p-4 bg-white bg-opacity-80 pt-24">
   
<div class="container mx-auto px-4 py-8">
    <div class="w-2/3  mx-auto">
        <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Detalles del Cliente</h2>
 
        <br>
        <form>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                <div class="col-span-1 md:col-span-2 border-b pb-4">
                    <h3 class="text-lg font-medium title-font mb-2 text-gray-700">Datos Personales</h3>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getNombre() %>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getApellido() %>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="dni">DNI:</label>
                    <input type="text" id="dni" name="dni" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getDni() %>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="cuil">CUIL:</label>
                    <input type="text" id="cuil" name="cuil" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getCuil()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="sexo">Sexo:</label>
                    <input type="text" id="sexo" name="sexo" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getSexo()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nacionalidad">Nacionalidad:</label>
                    <input type="text" id="nacionalidad" name="nacionalidad" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getNacionalidad()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="fecha-nacimiento">Fecha de Nacimiento:</label>
                    <input type="text" id="fecha-nacimiento" name="fecha-nacimiento" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getFechaNacimiento()%>" readonly>
                </div>              
                <div class="col-span-1 md:col-span-2 border-b pb-4 mt-4">
                    <h3 class="text-lg font-medium title-font mb-2 text-gray-700">Datos de Contacto</h3>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getDireccion()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="localidad">Localidad:</label>
                    <input type="text" id="localidad" name="localidad" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getLocalidad().getNombre()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="provincia">Provincia:</label>
                    <input type="text" id="provincia" name="provincia" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getLocalidad().getProvincia().getNombre()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="telefonos">Teléfono:</label>
                    <input type="text" id="telefonos" name="telefonos" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getTelefono()%>" readonly>
                </div> 
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="telefonos">Email:</label>
                    <input type="Email" id="Email" name="Email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getCorreo()%>" readonly>
                </div>     
                <div class="col-span-1 md:col-span-2 border-b pb-4 mt-4">
                    <h3 class="text-lg font-medium title-font mb-2 text-gray-700">Datos de la Cuenta</h3>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre-usuario">Nombre de Usuario:</label>
                    <input type="text" id="nombre-usuario" name="nombre-usuario" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getUsuario().getNombreUsuario()%>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="contrasena">Contraseña:</label>
                    <input type="password" id="contrasena" name="contrasena" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%=auxCliente.getUsuario().getPassword()%>" readonly>
                </div>          
            </div>           
            <section class="text-gray-600 body-font">
            <br>
			 <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900"">Cuentas</h2>
			  <div class="container px-5 py-24 mx-auto">
			    <div class="flex flex-wrap -m-4">
			      <div class="xl:w-1/3 md:w-1/2 p-4">
			        <div class="border border-gray-200 p-6 rounded-lg">
			          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-purple-100 text-purple-500 mb-4">
			               <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
			                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
			               </svg>
			          </div>
			          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">CBU: 15414579854478547</h2>
			          <p class="leading-relaxed text-base">Cuenta corriente.</p>
			        </div>
			      </div>
			      <div class="xl:w-1/3 md:w-1/2 p-4">
			        <div class="border border-gray-200 p-6 rounded-lg">
			          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-purple-100 text-purple-500 mb-4">
			               <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
			                  <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
			               </svg>
			          </div>
			          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">CBU: 15466579854478547</h2>
			          <p class="leading-relaxed text-base">Caja de ahorro.</p>
			        </div>
			      </div>
			      <div class="xl:w-1/3 md:w-1/2 p-4">
			        <div class="border border-gray-200 p-6 rounded-lg">
			          <div class="w-10 h-10 inline-flex items-center justify-center rounded-full bg-purple-100 text-purple-500 mb-4">
			            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
			               <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z" />
			            </svg>
			          </div>
			          <h2 class="text-lg text-gray-900 font-medium title-font mb-2">CBU: 656256386546565</h2>
			          <p class="leading-relaxed text-base">Cuenta corriente.</p>
			        </div>
			      </div>
			    </div>
			  </div>
			</section>
           </div>
        </form>
    </div>
</div>


    <div class="w-1/12 bgRight"></div>

</div>

    
 


    
    

 <jsp:include page="Footer.jsp" />
     

</body>
</html>
