<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 String usuario = null;
 String tipoUsuario = null;
if (session != null && session.getAttribute("usuario") != null && session.getAttribute("tipoUsuario") != null) {
	usuario = (String) session.getAttribute("usuario");
	tipoUsuario = (String) session.getAttribute("tipoUsuario");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Cliente</title>
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
        <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Perfil <%=usuario %></h2>
        <br>
        <form>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                <div class="col-span-1 md:col-span-2 border-b pb-4">
                    <h3 class="text-lg font-medium title-font mb-2 text-gray-700">Datos Personales</h3>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Lionel" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Messi" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="dni">DNI:</label>
                    <input type="text" id="dni" name="dni" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="25693692" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="cuil">CUIL:</label>
                    <input type="text" id="cuil" name="cuil" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="20-25693692-5" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="sexo">Sexo:</label>
                    <input type="text" id="sexo" name="sexo" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="M" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="nacionalidad">Nacionalidad:</label>
                    <input type="text" id="nacionalidad" name="nacionalidad" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Argentino" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="fecha-nacimiento">Fecha de Nacimiento:</label>
                    <input type="text" id="fecha-nacimiento" name="fecha-nacimiento" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="24/06/1987" readonly>
                </div>              
                <div class="col-span-1 md:col-span-2 border-b pb-4 mt-4">
                    <h3 class="text-lg font-medium title-font mb-2 text-gray-700">Datos de Contacto</h3>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Calle 4654" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="localidad">Localidad:</label>
                    <input type="text" id="localidad" name="localidad" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Rosario" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="provincia">Provincia:</label>
                    <input type="text" id="provincia" name="provincia" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Santa Fe" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="telefonos">Teléfono:</label>
                    <input type="text" id="telefonos" name="telefonos" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="123456789" readonly>
                </div>     
                 <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="telefonos">Email:</label>
                    <input type="Email" id="Email" name="Email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="lmessi@gmail.com" readonly>
                </div>     
            </div>           
           </div>
        </form>
    </div>
</div>


    <div class="w-1/12 bgRight"></div>
</div>
<jsp:include page="Footer.jsp" />
     

</body>
</html>
