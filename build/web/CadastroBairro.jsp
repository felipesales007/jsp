<%-- 
    Document   : CadastroBairro
    Created on : 25/07/2016, 22:54:45
    Author     : Felipe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Bairros</title>
    <link rel="stylesheet" href="LayoutGeral.css"
</head>
<body>
    <form id="Bairro" action="./SalvaBairro">
        <div id="geral">
        <div id="Titulo">
            <center>
                <h1>Cadastro de Bairro</h1>
            </center>
            
        </div>
        <div id="Campos">
            <h3>Nome do Bairro: <input type="text" name="txtBairro" value="" id="txtBairro"/></h3>
            <h3>Seleção da Cidade: <select name="selecaocidade" id="selecaocidade">
                <%
                    Conecta_Banco conexao = new Conecta_Banco();
                    Connection resp;
                    resp = conexao.conectaMysql("sistemavideoaula");                    
                    
                    conexao.ExecutaSql("select * from cidade order by nome_cidades");
                    conexao.resultSet.first();

                    do
                    {
                        out.println("<option>"+conexao.resultSet.getString("nome_cidades")+"</option>");
                    }while(conexao.resultSet.next());
                %>
                </select></h3>
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

                

