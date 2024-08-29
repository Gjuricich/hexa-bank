<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
         .bgLeft {
           background: linear-gradient(45deg, mediumslateblue, blueviolet, darkviolet, darkviolet, blueviolet, mediumslateblue);
            background-size: cover;            
        }
        .bgRight {
            background: linear-gradient(45deg, mediumslateblue, blueviolet, darkviolet, darkviolet, blueviolet, mediumslateblue);
            background-size: cover;
        }
    </style>
</head>
<body>
    <jsp:include page="NavBar.jsp"/>
    <div class="flex">
        <div class="w-1/12 bgLeft pt-24"></div>
        <div class="w-10/12 p-4 bg-white bg-opacity-80 pt-24">
            <div class="container mx-auto px-4 py-8">
                <div class="w-2/3 mx-auto">
                    <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Reportes Prestamos</h2>
                    <br>
                    <form action="ServletAdminCuentas" method="post">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="fechaInicio">Fecha de Inicio:</label>
                                <input type="date" id="fechaInicio" name="fechaInicio" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="fechaFin">Fecha de Fin:</label>
                                <input type="date" id="fechaFin" name="fechaFin" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4">
                                <div class="relative">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="estado">Estado del Prestamo:</label>
                                <select id="estado" name="estado" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="autorizado">Autorizado</option>
                                    <option value="rechazado">Rechazado</option>
                                    <option value="rechazado">En proceso</option>
                                </select>
                                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
								        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" /></svg>
								    </div>
								</div> 
                            </div>
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="estado">Importe:</label>
                              <div class="relative">
                               <select id="estado" name="estado" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                  <option value="opcionMonto1">Entre $500000 y $1000000</option>
                                  <option value="opcionMonto2">Entre $1000000 y $3000000</option>
                                  <option value="opcionMonto3">Mayor a $3000000</option>                                  
                               </select>
                                   <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
								        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" /></svg>
								    </div>
								</div> 
                            </div>                    
                        </div>
                           <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="DNIclienteReporte">Dni Cliente:</label>
                              <input type="text" id="DNIclienteReporte" name="DNIclienteReporte" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                        <button type="submit" name="btnGenerarReporte" class="flex mx-auto mt-16 text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Generar Reporte</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="w-1/12 bgRight pt-24"></div>
    </div>
    <jsp:include page="Footer.jsp" />
</body>
</html>
