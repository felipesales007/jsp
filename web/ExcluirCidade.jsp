<%-- 
    Document   : ExcluirCidade
    Created on : 30/07/2016, 21:09:35
    Author     : Felipe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Cidade</title>
        <link rel="stylesheet" href="ExcluirEstado.css">
    </head>
    <body>
        <form action="./DelCidade" id="Delete">
    <center>
        <h1>Excuir uma Cidade</h1>
        <h3>Informe um ID da cidade para ser excluido!</h3>
        
        <input type="text" name="txtCod" value="" id="txtCod"/>
        <input type="submit" value="Confirmar" name="btnConfirma" /></br></br>
        <div id="Tabela">
        <table border="2">
                <tr>
                    <th>Código</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                </tr>
                <%
                    Conecta_Banco conexao = new Conecta_Banco();
                    Connection resp;
                    resp = conexao.conectaMysql("sistemavideoaula");
                    
                    if(request.getParameter("acao") != null)
                    {
                        conexao.statement.execute("DELETE FROM cidade where id_cidade = "+request.getParameter("codigo"));
                    }
                    
                    conexao.ExecutaSql("select * from cidade inner join estados on cidade.id_estado = estados.id_estado order by id_cidade");
                    conexao.resultSet.first();

                    do
                    {
                        out.println("<tr>");
                        out.println("<td>"+conexao.resultSet.getInt("id_cidade")+"</td>");
                        out.println("<td>"+conexao.resultSet.getString("nome_cidades")+"</td>");
                        out.println("<td>"+conexao.resultSet.getString("nome_estado")+"</td>");
                        out.println("</tr>");
                    }while(conexao.resultSet.next());
                %>
        </table>
    </div>
        </center>
        </form>
    </body>
</html>
