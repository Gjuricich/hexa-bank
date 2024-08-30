<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transferencias</title>
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
        .ancho {
            width: 100%;
            max-width: 400px;
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
                    <div class="flex flex-col items-center w-full">
                        <h2 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Transferencias</h2>
                        <br>
                        <form class="flex flex-col items-center w-full">
                            <div class="mb-4 ancho">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="Cuenta de Origen">Cuenta de Origen</label>
                                <div class="relative">
                                    <select id="CuentaOrigen" name="CuentaOrigen" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                        <option value="CajaAhorro">N° 56523</option>
                                        <option value="CuentaCorriente">N° 56523</option>
                                    </select>
                                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                            <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4 ancho ">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="Cuenta de Destino">Cuenta de Destino</label>
                                <div class="relative">
                                    <select id="CuentaDestino" name="CuentaDestino" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                        <option value="CajaAhorro">N° 66525</option>
                                        <option value="CuentaCorriente">N° 56523</option>
                                    </select>
                                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                            <path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4 ancho">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="detalleTransferencia">Detalle:</label>
                                <input type="text" id="detalleTransferencia" name="detalleTransferencia" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4 ancho">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="importe">Importe:</label>
                                <input type="text" id="importe" name="importe" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="flex flex-col items-center w-full">
                                <button type="submit" name="btnTransferir" class="form-control mx-auto mt-16 text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Transferir</button>
                            </div>
                        </form>
                    </div>
                    <div class="flex justify-end w-full mt-4">
                        <button onclick="history.back()" class="text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Atrás</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-1/12 bgRight pt-24"></div>
    </div>
    <jsp:include page="Footer.jsp"/>
</body>
</html>
