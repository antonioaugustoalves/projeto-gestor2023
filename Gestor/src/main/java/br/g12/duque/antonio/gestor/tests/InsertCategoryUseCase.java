/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.g12.duque.antonio.gestor.tests;

import br.g12.duque.antonio.dao.CategoryDao;
import br.g12.duque.antonio.models.Category;
import javax.swing.JOptionPane;

/**
 *
 * @author judok
 */
public class InsertCategoryUseCase {
    public static void main(String[] args) {
        Category cat = new Category();
        String name = JOptionPane.showInputDialog("Nome:");
        String description = JOptionPane.showInputDialog("Descrição:");
        cat.setName(name);
        cat.setDescription(description);
        
        CategoryDao cd = new CategoryDao(cat);
        boolean success = cd.insert();
        
        if(success){
            JOptionPane.showMessageDialog(null, "Sucesso!");
        }else{
           JOptionPane.showMessageDialog(null, "Erro!"); 
        }
        
        
        
    }
}
