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
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="CBUorigenTransferencia">CBU de Origen:</label>
                                <input type="text" id="CBUorigenTransferencia" name="CBUorigenTransferencia" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4 ancho">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="CBUdestinoTransferencia">CBU de Destino:</label>
                                <input type="text" id="CBUdestinoTransferencia" name="CBUdestinoTransferencia" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4 ancho">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="detalleTransferencia2">Detalle:</label>
                                <input type="text" id="detalleTransferencia2" name="detalleTransferencia2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4 ancho">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="importe2">Importe:</label>
                                <input type="text" id="importe2" name="importe2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="flex flex-col items-center w-full">
                                <button type="submit" name="btnTransferir2" class="form-control mx-auto mt-16 text-white bg-purple-500 border-0 py-2 px-8 focus:outline-none hover:bg-purple-600 rounded text-lg">Transferir</button>
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
