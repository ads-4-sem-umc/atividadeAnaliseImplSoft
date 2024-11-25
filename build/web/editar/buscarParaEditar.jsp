<%-- 
    Document   : editar
    Created on : 23 de nov. de 2024, 14:19:05
    Author     : ruan
--%>

<%@page import="java.util.Optional"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Produto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <link rel="shortcut icon" href="../public/logo.png" type="image/png" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Editar produto</title>
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
    <h1>Editar produto por ID</h1>
    <div
        class="form-page"
    >   
        <%
            int id = Integer.parseInt(request.getParameter("id"));

            ProdutoDAO produtoDAO = new ProdutoDAO();
            Optional<Produto> produtoBuscado = produtoDAO.buscaPorId(id);
            if(produtoBuscado.isPresent()){
            Produto produtoEcontrado = produtoBuscado.get();
        %>
        <form
          method="post"
          action="editar.jsp"
          class="form-box"
        >
          <div class="form-line">
            <input type="hidden" id="inputId" name="id" value="<%=produtoEcontrado.getId()%>">
            <div class="form-group">
              <label for="inputDescricao">Descrição</label>
              <input
                required
                type="text"
                class="form-control"
                id="inputDescricao"
                name="descricao"
                placeholder="Digite a descrição do produto"
                value="<%=produtoEcontrado.getDescricao()%>"
              />
            </div>
            <div class="form-group">
              <label for="inputCodigoBarra">Código de barra</label>
              <input
                required
                type="number"
                class="form-control"
                id="inputCodigoBarra"
                name="codigoBarra"
                placeholder="Digite o código de barra"
                value="<%=produtoEcontrado.getCodigoBarra()%>"
              />
            </div>
          </div>
          <div class="form-line">
            <div class="form-group">
              <label for="inputEstoque">Estoque</label>
              <input
                required
                type="number"
                class="form-control"
                id="inputEstoque"
                name="estoque"
                placeholder="Digite o estoque do produto"
                value="<%=produtoEcontrado.getEstoque()%>"
              />
            </div>
            <div class="form-group">
              <label for="inputNomeVendedor">Nome vendedor</label>
              <input
                required
                type="text"
                class="form-control"
                id="inputNomeVendedor"
                name="nomeVendedor"
                placeholder="Digite o nome do vendedor"
                value="<%=produtoEcontrado.getNomeVendedor()%>"
              />
            </div>
          </div>
          <div class="form-line">
            <div class="form-group">
              <label for="inputCusto">Custo</label>
              <input
                required
                type="number"
                class="form-control"
                id="inputCusto"
                name="custo"
                placeholder="Digite o custo do produto"
                value="<%=produtoEcontrado.getCusto()%>"
              />
            </div>
            <div class="form-group">
              <label for="inputValorVenda">Valor de venda</label>
              <input
                required
                type="number"
                class="form-control"
                id="inputValorVenda"
                name="valorVenda"
                placeholder="Digite o valor de venda"
                value="<%=produtoEcontrado.getValorVenda()%>"
              />
            </div>
          </div>
          <button
            type="submit"
            class="btn btn-primary button"
          >
            Editar
          </button>
        </form>
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
