/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.g12.duque.antonio.dao;

import br.g12.duque.antonio.gestor.Conexao;
import br.g12.duque.antonio.gestor.InterBanco;
import br.g12.duque.antonio.models.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author judok
 */
public class CategoryDao implements InterBanco{
    
    private Category category;
    
    public CategoryDao(Category cat){
        this.category = cat;
    }
    //Annotation ou Decorator que indica:
    //Que eu vou sobreescrever um método
    @Override  
    public boolean insert() {
        String sql = "INSERT INTO categories "
                +"(name, description) VALUES "
                +"(?,?)";
        boolean success = false;
        Connection conn = Conexao.getConnection();
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1,category.getName());
            pst.setString(2,category.getDescription());
            pst.executeUpdate();
            success = true;
        }catch(SQLException ex){
            System.out.println("Erro:"+ex.getMessage());
            success = false;
        }
        return success;
    }

    @Override
    public boolean update() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean findById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

      
}
