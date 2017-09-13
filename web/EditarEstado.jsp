<%-- 
    Document   : EditarEstado
    Created on : 27/07/2016, 19:56:37
    Author     : Felipe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Estado</title>
    </head>
    <body style="background-color: burlywood">
        <form action="./EditaEstado">
    <center>
        <h1>Formulario para edição de estado</h1>
        <h3>Códfigo: <input type="text" name="txtCodEstado" value=""/></h3>
        <h3>Nome: <input type="text" name="txtNomeEstado" value=""/></h3>
        <h3>Sigla: <input type="text" name="txtSiglaEstado" value=""/></h3>        
        <input type="submit" value="Salvar Edição" name="btnEdit" />
        
        <h2>Lista de estados cadastrados</h2>
        
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
    </center>
        </form>
    </body>
</html>
