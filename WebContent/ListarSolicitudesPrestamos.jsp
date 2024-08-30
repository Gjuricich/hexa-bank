<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autorización de Préstamos</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>
    <link rel="icon" type="image/png" href="Images/logo.png">
</head>
<body>

	<jsp:include page="NavBar.jsp" />
	<div class="bg-white pt-24">
	
	<div class="container mx-auto px-4 py-8" style="width: 80%; overflow-y: auto;  min-height: 600px;">
	      
	    <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900" style="margin-top:3%;">Autorización de Préstamos</h2>
	        <br>
	         <br>
	    <table id="tablaPrestamos" class="display compact">
	
	        <thead>
	            <tr>  
	                <th>N° Préstamo</th>
	                <th>Cliente</th>
	                <th>Importe Solicitado</th>
                    <th>Cant. Cuotas</th>
	                <th>Interés Mensual</th>
	                <th>Cuotas</th>
	                <th>Fecha</th>
	                <th>Autorizar</th>
	                <th>Rechazar</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>1523</td>
	                <td>Lionel Messi</td>	             
	                <td>$600000</td>
	                <td>12</td>
	                <td>30%</td>
	                <td>$65000</td>
	                <td>20/06/2023</td>
	                <td><button type="submit" name="btnAutorizar" class="flex mx-auto mt-6 text-white bg-green-500 border-0 py-2 px-5 focus:outline-none hover:bg-green-600 rounded">Autorizar</button>
	                </td>
	                <td><button type="submit" name="btnRechazar" class="flex mx-auto mt-6 text-white bg-red-500 border-0 py-2 px-5 focus:outline-none hover:bg-red-600 rounded">Rechazar</button>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	</div>
	
	<script>
	$(document).ready(function() {
	    $('#tablaPrestamos').DataTable();
	});
	</script>
	
	</div>
	
	<jsp:include page="Footer.jsp" />

</body>
</html>

