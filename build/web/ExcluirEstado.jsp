<%-- 
    Document   : ExcluirEstado
    Created on : 27/07/2016, 19:55:29
    Author     : Felipe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Estado</title>
        <link rel="stylesheet" href="ExcluirEstado.css">
    </head>
    <body>
        <form action="./DelEstado" id="Delete">
    <center>
        <h1>Excuir um estado</h1>
    
        <h3>Informe um ID do estado para ser excluido!</h3>
        
        <input type="text" name="txtCod" value="" id="txtCod"/>
        <input type="submit" value="Confirmar" name="btnConfirma" /></br></br>
        <div id="Tabela">
        <table border="2">
                <tr>
                    <th>Código</th>
                    <th>Descrição</th>
                    <th>Sigla</th>
                </tr>
                <%
                    Conecta_Banco conexao = new Conecta_Banco();
                    Connection resp;
                    resp = conexao.conectaMysql("sistemavideoaula");
                    
                    conexao.ExecutaSql("select * from estados order by nome_estado");
                    conexao.resultSet.first();

                    do
                    {
                        out.println("<tr>");
                        out.println("<td>"+conexao.resultSet.getInt("id_estado")+"</td>");
                        out.println("<td>"+conexao.resultSet.getString("nome_estado")+"</td>");
                        out.println("<td>"+conexao.resultSet.getString("sigla_estado")+"</td>");
                        out.println("</tr>");
                    }while(conexao.resultSet.next());
                %>
        </table>
    </div>
        </center>
        </form>
    </body>
</html>
