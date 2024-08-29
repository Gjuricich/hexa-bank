<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle Cuenta</title>
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
	 <div class="w-1/12 bgLeft pt-24"></div>
	   <div class="w-10/12 p-4 bg-white bg-opacity-80 pt-24">
			<div class="container mx-auto px-4 py-8">
			    <div class="w-2/3  mx-auto">
			       <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Detalle cuenta</h2>
			       <br>
			       <form action="ServletAdminCuentas" method="post">
					    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
					        <div class="mb-4">
					            <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">Cliente:</label>
					            <input type="text" id="nombre" name="nombre" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Lionel Messi" readonly>
					        </div>
					         <div class="mb-4">
					            <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">Tipo de Cuenta:</label>
					            <input type="text" id="tipoCuentaDetalle" name="tipoCuentaDetalle" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="Cuenta corriente" readonly>
					        </div>
					        <div class="mb-4">
					            <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">Fecha de creación:</label>
					            <input type="text" id="fechaDetalle" name="fechaDetalle" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="12/06/2023" readonly>
					        </div>
					        <div class="mb-4">
					            <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">N° de Cuenta:</label>
					            <input type="text" id="nroCuentaDetalle" name="nroCuentaDetalle" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="55569" readonly>
					        </div>
					          <div class="mb-4">
					            <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">CBU:</label>
					            <input type="text" id="cbuDetalle" name="cbuDetalle" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="555168645867416899669" readonly>
					        </div>
					          <div class="mb-4">
					            <label class="block text-gray-700 text-sm font-bold mb-2" for="nombre">Saldo:</label>
					            <input type="text" id="saldoDetalle" name="saldoDetalle" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="$10000" readonly>
					        </div>
					      </div>
					      
					      <button type="submit" name="btnMovimientosCuenta" class="flex mx-auto mt-16 text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Movimientos</button>
                    </form>
                    <div class="flex justify-end mt-4 mt-4">
                        <button onclick="history.back()" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Atrás</button>
                    </div>
			        </div>
			    </div>
	    </div>
	    <div class="w-1/12 bgRight pt-24"></div>
	    </div>
	 <jsp:include page="Footer.jsp" />
	     

</body>
</html>