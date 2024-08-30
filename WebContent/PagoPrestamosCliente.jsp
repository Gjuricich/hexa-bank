<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pago Préstamos</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>
    <link rel="icon" type="image/png" href="Images/logo.png">
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

    <jsp:include page="NavBar.jsp" />
    	<div class="flex">
     <div class="w-1/12 bgLeft pt-24"></div>
     <div class="w-10/12 p-4 bg-white bg-opacity-80 pt-5">
    <div class="bg-white pt-5">  
    <div class="container mx-auto px-4 py-8" style="width: 80%; overflow-y: auto;">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-24 mx-auto">
                <div class="flex flex-col text-center w-full mb-20">
                    <h1 class="sm:text-4xl text-3xl font-medium title-font mb-2 text-gray-900">Pago Préstamos</h1>
                    <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Ingrese en el préstamo que desea pagar.</p>
                </div>
         <div class="lg:w-3/4 w-full mx-auto overflow-auto">
    <div class="shadow-md">
        <div class="border-t-2 border-gray-200">
            <button class="w-full px-4 py-2 text-left focus:outline-none focus:bg-gray-200" onclick="toggleSection('section1')">Id Préstamo: 1254</button>
            <div id="section1" class="hidden px-4 py-2">
                <section class="text-gray-600 body-font">
                    <div class="container px-5 py-24 mx-auto">
                        <div class="flex flex-col text-center w-full mb-20">
                            <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Seleccione la cuota que desea pagar:</p>
                        </div>
                        <div class="lg:w-2/3 w-full mx-auto overflow-auto">
                            <table class="table-auto w-full text-left whitespace-no-wrap">
                                <thead>
                                    <tr>
                                        <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">ID cuota</th>
                                        <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100">N° de Cuota</th>
                                        <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100">Importe</th>
                                        <th class="w-10 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tr rounded-br"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="px-4 py-3">1001</td>
                                        <td class="px-4 py-3">1</td>
                                        <td class="px-4 py-3">$35000</td>
                                        <td class="w-10 text-center">
                                            <input name="Pagar" type="radio">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3">1002</td>
                                        <td class="px-4 py-3">2</td>
                                        <td class="px-4 py-3">$35000</td>
                                        <td class="w-10 text-center">
                                            <input name="Pagar" type="radio">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3">1003</td>
                                        <td class="px-4 py-3">3</td>
                                        <td class="px-4 py-3">$35000</td>
                                        <td class="w-10 text-center">
                                            <input name="Pagar" type="radio">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-4 py-3">1004</td>
                                        <td class="px-4 py-3">4</td>
                                        <td class="px-4 py-3">$35000</td>
                                        <td class="w-10 text-center">
                                            <input name="Pagar" type="radio">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="flex pl-4 mt-4 lg:w-2/3 w-full mx-auto">
                            <button class="flex ml-auto text-white bg-purple-500 border-0 py-2 px-6 focus:outline-none hover:bg-purple-600 rounded">Pagar</button>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="border-t-2 border-gray-200">
            <button class="w-full px-4 py-2 text-left focus:outline-none focus:bg-gray-200" onclick="toggleSection('section2')">Id Préstamo: 1554</button>
            <div id="section2" class="hidden px-4 py-2">
                <p>.</p>
            </div>
        </div>
        <div class="border-t-2 border-gray-200">
            <button class="w-full px-4 py-2 text-left focus:outline-none focus:bg-gray-200" onclick="toggleSection('section3')">Id Préstamo: 2654</button>
            <div id="section3" class="hidden px-4 py-2">
                <p>.</p>
            </div>
        </div>
    </div>
</div>

            </div>
        </section>
    
    </div>
    </div>
      </div>
      
	    <div class="w-1/12 bgRight pt-24"></div>
	     </div>
    
    <jsp:include page="Footer.jsp" />

    <script>
        function toggleSection(sectionId) {
            const section = document.getElementById(sectionId);
            section.classList.toggle('hidden');
        }
    </script>

</body>
</html>

