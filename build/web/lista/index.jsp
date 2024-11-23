<%-- 
    Document   : index
    Created on : 23 de nov. de 2024, 15:54:50
    Author     : muralis
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Listagem de produtos</title>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body style="display: flex; flex-direction: column; align-items: center">
    <a
      href="../index.html"
      style="
        display: flex;
        gap: 12px;
        text-decoration: none;
        color: #000;
        width: 100%;
      "
    >
      <img
        src="../public/arrow-left.png"
        alt="arrow left"
        style="width: 32px; height: 32px"
      />
      <h2>Voltar</h2>
    </a>
    <div
        style="
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 64px;
        gap: 32px;
      "
    >
      <h1>Listagem de produtos</h1>
        <%                    
            ProdutoDAO produtoDAO = new ProdutoDAO();
            
            List<Produto> produtos = new ArrayList<>();
            produtos = produtoDAO.listar();
            
            int numRegistros = 0 ;
        %>   
        <table class="table table-striped">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Id</th>
                <th scope="col">Descrição</th>
                <th scope="col">Código de barra</th>
                <th scope="col">Estoque</th>
                <th scope="col">Vendedor</th>
                <th scope="col">Custo</th>
                <th scope="col">Valor de venda</th>
            </tr>
            <%   
                for( int i = 0; i <= produtos.size()-1; i++){                
            %>   
            <tr>
                <th scope="row"><%= numRegistros + 1 %></th>
                <td><%= produtos.get(i).getId() %> </td>
                <td><%= produtos.get(i).getDescricao()%> </td>
                <td><%= produtos.get(i).getCodigoBarra()%></td>
                <td><%= produtos.get(i).getEstoque()%></td>
                <td><%= produtos.get(i).getNomeVendedor()%></td>
                <td>R$ <%= produtos.get(i).getCusto()%></td>
                <td>R$ <%= produtos.get(i).getValorVenda()%></td>
            </tr> 
            <%
                numRegistros++;                           
            }
            %>
        </table>
        <%                                                     
            out.println("Total de registros: " + numRegistros);
        %>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
