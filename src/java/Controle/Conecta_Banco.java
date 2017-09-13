package Controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class Conecta_Banco
{
    public Statement statement;
    public ResultSet resultSet;
    public Connection con = null;
    String caminho = "jdbc:mysql://localhost/sistemavideoaula";
    String usuario = "root";
    String senha = "";
    
    public Connection conectaMysql(String banco)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            try
            {
                con = DriverManager.getConnection(caminho, usuario, senha);
            }
            catch(SQLException ex)
            {
                System.out.println("Caminho, senha ou usuário incorreto");
            }
        }
        catch(ClassNotFoundException ex)
        {
            System.out.println("Driver não encontrado");
        }
        return con;
    }
    
    public void ExecutaSql(String sql)
    {
        try
        {
            statement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
            resultSet = statement.executeQuery(sql);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "ERRO: " + e);
        }
    }
}