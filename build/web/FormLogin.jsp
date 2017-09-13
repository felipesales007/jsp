<%-- 
    Document   : FormLogin
    Created on : 24/07/2016, 21:34:09
    Author     : Felipe
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controle.Conecta_Banco"%>
<html>
    <head>
        <title>Formulário de login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="index.css">
    </head>
    <body style="background-color: burlywood">
        <%
            Conecta_Banco conn = new Conecta_Banco();
            conn.conectaMysql("sistemavideoaula");
            Connection conexecao = conn.conectaMysql("sistemavideoaula");
            
            if (conexecao != null) 
            {
                out.println("Conectado");
            } 
            else
            {
                out.println("Não Conectado");
            }
        %>
        <form id="Principal" action="FormLogin.jsp">
        <div id="Texto1">
            <h3>Insira Login e Senha</h3>
        </div>
        <div id="Campos">
            <br>
            Login:<input type="text" name="txtLog" value="" id="txtLog"/><br><br>
            Senha:<input type="password" name="txtSenha" value="" id="txtSenha"/><br><br>
            <%
                if(conexecao != null)
                {
                    if(request.getParameter("txtLog") != null && (request.getParameter("txtSenha") != null))
                    {
                        String login, pass;
                        login = request.getParameter("txtLog");
                        pass = request.getParameter("txtSenha");
                        
                        Statement st;
                        ResultSet rs;
                        st = conexecao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
                        rs = st.executeQuery("SELECT * FROM login where login = '"+login+"' and senha = '"+pass+"'");
                        if(rs.next())
                        {
                            response.sendRedirect("PaginaPrincipal.jsp");
                        }
                    }
                    else
                    {
                        out.println("Não foi possivel logar!");
                    }
                }
            %>
        </div>
        <input type="submit" value="Logar" name="btnLog" id="btnLog"/>  
        </form>
    </body>
</html>
