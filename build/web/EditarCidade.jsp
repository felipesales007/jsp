<%-- 
    Document   : EditarCidade
    Created on : 01/08/2016, 19:59:47
    Author     : Felipe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cidade</title>
    </head>
    <body>
        <form action="./EditaCidade">
        <center>
        <h1>Editar Cidade</h1>
        
            
            <h3>Código: <input type="text" name="txtCod" value="" /></h3>
            <h3>Cidade: <input type="text" name="txtCidade" value="" /></h3>
            <h3>Estado: <select name="estado">
                    <%
                        Conecta_Banco conexao = new Conecta_Banco();
                        Connection resp;
                        resp = conexao.conectaMysql("sistemavideoaula");

                        conexao.ExecutaSql("select * from estados order by id_estado");
                        conexao.resultSet.first();

                        do
                        {
                            out.println("<option>"+conexao.resultSet.getString("sigla_estado")+"</option>");
                        }while(conexao.resultSet.next());
                    %>
                </select> </h3>
            <input type="submit" value="Editar" name="btnEditar" /> 
            </br></br>
            <table border="2">
                <tr>
                    <th>Código</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                </tr>
            <%
                        conexao.ExecutaSql("select * from cidade inner join estados on cidade.id_estado = " + " estados.id_estado");
                        conexao.resultSet.first();

                        do
                        {
                            out.println("<tr>");
                            out.println("<td>"+conexao.resultSet.getInt("id_cidade")+"</td>");
                            out.println("<td>"+conexao.resultSet.getString("nome_cidades")+"</td>");
                            out.println("<td>"+conexao.resultSet.getString("sigla_estado")+"</td>");
                            out.println("</tr>");
                        }while(conexao.resultSet.next());
                    %>
            </table>
        </form>
    </body>
</html>
