/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.math.BigDecimal;
import model.Produto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import util.ConectaBD;

/**
 *
 * @author ruan
 */
public class ProdutoDAO {
    
    public boolean cadastrar(Produto produto) throws ClassNotFoundException {
        Connection conexao = null;
        try{
            conexao = ConectaBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = String.format("INSERT INTO "
                    + "produto(descricao, codigo_barra, estoque, nome_vendedor, custo, valor_venda) "
                    + "VALUES ('%s', '%s', %s, '%s', %s, %s)",
                    produto.getDescricao(), produto.getCodigoBarra(), produto.getEstoque(), 
                    produto.getNomeVendedor(), produto.getCusto(), produto.getValorVenda()
            );
            stmt.executeUpdate(sql);
            return true;
        } catch(SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
    public boolean editar(Produto produto) throws ClassNotFoundException {
        Connection conexao = null;
        try{
            conexao = ConectaBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = String.format("UPDATE produto"
                    + " SET descricao='%s', codigo_barra='%s', estoque=%s, nome_vendedor='%s', custo=%s, valor_venda=%s"
                    + " WHERE id=%s",
                    produto.getDescricao(), produto.getCodigoBarra(), produto.getEstoque(), 
                    produto.getNomeVendedor(), produto.getCusto(), produto.getValorVenda(),
                    produto.getId()
            );
            stmt.executeUpdate(sql);
            return true;
        } catch(SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
    public boolean excluir(int id) throws ClassNotFoundException {
        Connection conexao = null;
        try{
            conexao = ConectaBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = String.format("DELETE FROM produto WHERE id=%s", id);
            stmt.executeUpdate(sql);
            return true;
        } catch(SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
    public Optional<Produto> buscaPorId(int id) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = String.format("SELECT * FROM produto WHERE id=%s", id);
            ResultSet result = stmt.executeQuery(sql);
            Produto produtoEncontrado = new Produto();
            int numRegistros = 0;  
            while (result.next()) {               
                produtoEncontrado.setId(id);
                produtoEncontrado.setDescricao(result.getString("descricao"));  
                produtoEncontrado.setCodigoBarra(result.getString("codigo_barra"));                
                produtoEncontrado.setEstoque(Integer.parseInt(result.getString("estoque")));                
                produtoEncontrado.setNomeVendedor(result.getString("nome_vendedor"));                
                produtoEncontrado.setCusto(BigDecimal.valueOf(Double.parseDouble(result.getString("custo"))));                
                produtoEncontrado.setValorVenda(BigDecimal.valueOf(Double.parseDouble(result.getString("valor_venda")))); 
                numRegistros++;
            }
            conexao.close();
            return numRegistros == 0 ? Optional.empty() : Optional.of(produtoEncontrado);
        } catch(SQLException ex) {
            System.out.println("Erro:" + ex);
            return Optional.empty();
        }
    }
    
    public Optional<Produto> buscaPorDescricao(String descricao) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = String.format("SELECT * FROM produto WHERE descricao='%s'", descricao);
            ResultSet result = stmt.executeQuery(sql);
            Produto produtoEncontrado = new Produto();
            int numRegistros = 0;  
            while (result.next()) {               
                produtoEncontrado.setId(Integer.parseInt(result.getString("id")));
                produtoEncontrado.setDescricao(result.getString("descricao"));  
                produtoEncontrado.setCodigoBarra(result.getString("codigo_barra"));                
                produtoEncontrado.setEstoque(Integer.parseInt(result.getString("estoque")));                
                produtoEncontrado.setNomeVendedor(result.getString("nome_vendedor"));                
                produtoEncontrado.setCusto(BigDecimal.valueOf(Double.parseDouble(result.getString("custo"))));                
                produtoEncontrado.setValorVenda(BigDecimal.valueOf(Double.parseDouble(result.getString("valor_venda")))); 
                numRegistros++;
            }
            conexao.close();
            return numRegistros == 0 ? Optional.empty() : Optional.of(produtoEncontrado);
        } catch(SQLException ex) {
            System.out.println("Erro:" + ex);
            return Optional.empty();
        }
    }
    
    public List<Produto> listar() throws ClassNotFoundException {
        Connection conexao = null;
        List<Produto> produtos = new ArrayList();
        try {
            conexao = ConectaBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = String.format("SELECT * FROM produto");
            ResultSet result = stmt.executeQuery(sql);
            int numRegistros = 0;  
            while (result.next()) {       
                Produto produtoEncontrado = new Produto();
                produtoEncontrado.setId(Integer.parseInt(result.getString("id")));
                produtoEncontrado.setDescricao(result.getString("descricao"));  
                produtoEncontrado.setCodigoBarra(result.getString("codigo_barra"));                
                produtoEncontrado.setEstoque(Integer.parseInt(result.getString("estoque")));                
                produtoEncontrado.setNomeVendedor(result.getString("nome_vendedor"));                
                produtoEncontrado.setCusto(BigDecimal.valueOf(Double.parseDouble(result.getString("custo"))));                
                produtoEncontrado.setValorVenda(BigDecimal.valueOf(Double.parseDouble(result.getString("valor_venda")))); 
                produtos.add(produtoEncontrado);
                numRegistros++;
            }
            conexao.close();
            return produtos;
        } catch(SQLException ex) {
            System.out.println("Erro:" + ex);
            return produtos;
        }
    }
    
}
