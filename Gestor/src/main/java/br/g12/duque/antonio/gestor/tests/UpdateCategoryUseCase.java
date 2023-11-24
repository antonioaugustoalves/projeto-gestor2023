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
public class UpdateCategoryUseCase {
    public static void main(String[] args) {
        String strCodigo = JOptionPane.showInputDialog(null, "Digite o código");
        String nome = JOptionPane.showInputDialog(null, "Novo nome:");
        String descricao = JOptionPane.showInputDialog(null, "Nova descricao:");
        int codigo = Integer.valueOf(strCodigo);
        Category categoria = new Category(codigo, nome, descricao);
        CategoryDao dao = new CategoryDao(categoria);
        
        boolean sucesso = dao.update();
        
        if(sucesso){
            JOptionPane.showMessageDialog(null, "Registro atualizado");
        }else{
           JOptionPane.showMessageDialog(null, "Erro na atualização"); 
        }
        
    }
}
