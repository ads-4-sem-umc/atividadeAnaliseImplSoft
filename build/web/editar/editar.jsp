<%-- 
    Document   : editar
    Created on : 23 de nov. de 2024, 14:40:45
    Author     : muralis
--%>

<%@page import="dao.ProdutoDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Editar produto</title>
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
        padding: 64px;
      "
    >   
        <p style="font-size: 60px; font-weight: 700">
            <%
            int id = Integer.parseInt( request.getParameter("id") );
            String descricao = request.getParameter("descricao");
            String codigoBarra = request.getParameter("codigoBarra");
            int estoque = Integer.parseInt( request.getParameter("estoque") );
            String nomeVendedor = request.getParameter("nomeVendedor");
            Double custo = Double.parseDouble(request.getParameter("custo") );
            Double valorVenda = Double.parseDouble(request.getParameter("valorVenda") );

            Produto produto = new Produto();
            produto.setId(id);
            produto.setDescricao(descricao);
            produto.setCodigoBarra(codigoBarra);
            produto.setEstoque(estoque);
            produto.setNomeVendedor(nomeVendedor);
            produto.setCusto(BigDecimal.valueOf(custo));
            produto.setValorVenda(BigDecimal.valueOf(valorVenda));

            ProdutoDAO produtoDAO = new ProdutoDAO();
            if(produtoDAO.editar(produto)){
                out.println("Produto editado com sucesso!");
            }else{
               out.println("Erro ao editar produto!");
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