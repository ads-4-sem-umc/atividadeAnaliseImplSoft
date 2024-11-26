<%-- 
    Document   : consultar
    Created on : 23 de nov. de 2024, 15:16:46
    Author     : ruan
--%>

<%@page import="java.util.Optional"%>
<%@page import="model.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="shortcut icon" href="../public/logo.png" type="image/png" />
    <link rel="stylesheet" href="style.css" />
    <title>Consulta produto por ID</title>
        <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body class="body">
    <div class="nav-bar">
      <a href="../index.html">
        <img src="../public/logo.png" alt="Logo" class="logo" />
      </a>
      <a href="../index.html">
        <img
          src="../public/sign-out.png"
          alt="arrow left"
          class="sign-out-icon"
        />
      </a>
    </div>
    <div class="page-consultar">   
        <%
            int id = Integer.parseInt(request.getParameter("id"));

            ProdutoDAO produtoDAO = new ProdutoDAO();
            Optional<Produto> produtoBuscado = produtoDAO.buscaPorId(id);
            if(produtoBuscado.isPresent()){
            Produto produtoEcontrado = produtoBuscado.get();
        %>
        <div>
            <h1 class="title-consultar">Produto encontrado</h1>
            <div class="fields-consultar">
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
