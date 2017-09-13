<%-- 
    Document   : CadastroCidade
    Created on : 25/07/2016, 22:53:51
    Author     : Felipe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Cidade</title>
        <link rel="stylesheet" href="LayoutGeral.css"
    </head>
    <body>
        <form id="Estado" action="./SalvaCidade">
            <div id="Titulo">
                <h1>Cadastro de Cidade</h1>
            </div>
            <div id="Campos">
                <h3>Nome da cidade: <input type="text" name="txtCidade" value="" id="txtCidade"/></h3>
                <h3>Seleção de estado: <select name="selecaoestado" id="selecaoestado">
                        <%
                    Conecta_Banco conexao = new Conecta_Banco();
                    Connection resp;
                    resp = conexao.conectaMysql("sistemavideoaula");                    
                    
                    conexao.ExecutaSql("select * from estados order by nome_estado");
                    conexao.resultSet.first();

                    do
                    {
                        out.println("<option>"+conexao.resultSet.getString("nome_estado")+"</option>");
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
