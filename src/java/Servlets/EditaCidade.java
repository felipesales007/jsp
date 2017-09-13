/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controle.Conecta_Banco;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe
 */
@WebServlet(name = "EditaCidade", urlPatterns = {"/EditaCidade"})
public class EditaCidade extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Conecta_Banco conexao = new Conecta_Banco();
    Connection resp;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int cod = Integer.parseInt(request.getParameter("txtCod"));
        String nome = request.getParameter("txtCidade");
        String estado = request.getParameter("estado");
        int codEstado;
        
        if((!nome.equals("")) && (!estado.equals("")) && (cod != 0))
        {
            try{
                resp = conexao.conectaMysql("sistemavideoaula");
                if(resp != null){
                    conexao.ExecutaSql("select * from estados where sigla_estado = '"+estado+"'");
                    conexao.resultSet.first();
//                    if(!conexao.resultSet.first())
//                    {"UPDATE clientes SET Cliente = ?, CPF = ?, Telefone = ?, Pet = ?, Raca = ?, Idade = ? WHERE ID = '" + this.id_cliente.getText() + "'");

                        codEstado = conexao.resultSet.getInt("id_estado");

                        PreparedStatement pst = resp.prepareStatement("UPDATE cidade SET nome_cidades = ?, id_estado = ? WHERE id_cidade = ?");
                        pst.setString(1, nome);
                        pst.setInt(2, codEstado);
                        pst.setInt(3, cod);
                        pst.execute();
                        response.sendRedirect("SucessoCadastro.jsp");
//                    }
//                    else
//                    {
//                        response.sendRedirect("FalhaCadastro.jsp");
//    //                  AchaEstado = conexao.resultSet.getString("sigla_estado");
//                    }
                }
            }catch (SQLException ex) {
                Logger.getLogger(SalvaEstado.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
        {
            response.sendRedirect("FalhaCadastro.jsp");    
        }
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet EditaCidade</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet EditaCidade at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
