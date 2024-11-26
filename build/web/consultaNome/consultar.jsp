<%-- 
    Document   : consultar
    Created on : 23 de nov. de 2024, 15:34:31
    Author     : ruan
--%>

<%@page import="java.util.Optional"%>
<%@page import="model.Produto"%>
<%@page import="model.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Consulta produto por nome</title>
        <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body style="display: flex; flex-direction: column; align-items: center; height: 100vh">
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
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
      "
    >   
        <%
            String descricao = request.getParameter("descricao");

            ProdutoDAO produtoDAO = new ProdutoDAO();
            Optional<Produto> produtoBuscado = produtoDAO.buscaPorDescricao(descricao);
            if(produtoBuscado.isPresent()){
            Produto produtoEcontrado = produtoBuscado.get();
        %>
        <div>
            <h1 style="margin-bottom: 32px">Produto encontrado</h1>
            <div style="display: flex; flex-direction: column; align-items: flex-start; width: 100%">
                <p>ID: <%=produtoEcontrado.getId()%></p>
                <p>Descrição: <%=produtoEcontrado.getDescricao()%></p>
                <p>Código de barra: <%=produtoEcontrado.getCodigoBarra()%></p>
                <p>Estoque: <%=produtoEcontrado.getEstoque()%></p>
                <p>Nome vendedor: <%=produtoEcontrado.getNomeVendedor()%></p>
                <p>Custo: R$ <%=produtoEcontrado.getCusto()%></p>
                <p>Valor de venda: R$ <%=produtoEcontrado.getValorVenda()%></p>
            </div>
        </div>
        <%
            }else{
               out.println("<p style='font-size: 60px; font-weight: 700'> Produto não encontrado!</p>");
            }
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
