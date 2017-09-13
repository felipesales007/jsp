<%-- 
    Document   : Cadastro_Estado
    Created on : 24/07/2016, 16:23:40
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Estado</title>
        <link rel="stylesheet" href="LayoutGeral.css"
    </head>
    <body>
        <form id="Estado" action="./SalvaEstado">
            <div id="Titulo">
                <h1>Cadastro de Estado</h1>
            </div>
            <div id="Campos">
                <h3>Nome do estado: <input type="text" name="txtEstado" value="" /></h3>
                <h3>Sigla do estado: <input type="text" name="txtSigla" value="" /></h3>
            </div>
            <div id="botoes">
                <input type="submit" value="Gravar" name="btnGravar" />
                <%-- 
                    <input type="submit" value="Editar" name="btnEditar" />
                    <input type="submit" value="Excluir" name="btnExcluir" />
                --%>
            </div>
        </form>
    </body>
</html>
