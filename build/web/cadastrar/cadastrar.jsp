<%-- Document : cadastrar Created on : 23 de nov. de 2024, 11:17:46 Author :
muralis --%> <%@page import="dao.ProdutoDAO"%> <%@page
import="java.math.BigDecimal"%> <%@page import="model.Produto"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Cadastrar produto</title>
    <link rel="shortcut icon" href="../public/logo.png" type="image/png" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body
    style="
      display: flex;
      flex-direction: column;
      align-items: center;
      height: 100vh;
    "
  >
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
    <div
      style="
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 64px;
      "
    >
      <p style="font-size: 60px; font-weight: 700">
        <% 
            String descricao = request.getParameter("descricao"); 
            String codigoBarra = request.getParameter("codigoBarra"); 
            int estoque = Integer.parseInt( request.getParameter("estoque") ); 
            String nomeVendedor = request.getParameter("nomeVendedor"); 
            Double custo = Double.parseDouble(request.getParameter("custo") ); 
            Double valorVenda = Double.parseDouble(request.getParameter("valorVenda") ); 
            
            Produto produto = new Produto(); 
            produto.setDescricao(descricao);
            produto.setCodigoBarra(codigoBarra); 
            produto.setEstoque(estoque);
            produto.setNomeVendedor(nomeVendedor);
            produto.setCusto(BigDecimal.valueOf(custo));
            produto.setValorVenda(BigDecimal.valueOf(valorVenda)); 
            
            ProdutoDAO produtoDAO = new ProdutoDAO(); 
            if(produtoDAO.cadastrar(produto)){
                out.println("Produto cadastrado com sucesso!"); 
            }else{ 
                out.println("Erro ao cadastrar produto!"); 
            } 
        %>
      </p>
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
