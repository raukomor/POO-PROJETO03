<%-- 
    Document   : Home
    Created on : 24/09/2017, 21:06:53
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Fatec PG</title>
        <!--<link rel="icon" href="res/images/LogoTransp.png">-->
        <!-- Bootstrap -->
        <!--<link href="res/styles/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
        <!--<link href="res/styles/style.css" rel="stylesheet" type="text/css"/>-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/app.js" defer="defer"></script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>

<!-- Promo Section - "We know design" -->
<div class="container-fluid" id="sobre" style="padding:108px; ">
  <div class="row">
    <div class="col-md-6">
      <h3>Sobre o Projeto.</h3>
      <p>Este site provê o cadastramento de clientes e fornecedores, possibilitando a suas respectivas edições e exclusões.</p>
      
    </div>
    <div class="col-md-6">
        <img class="img-rounded" src="images/content.jpg" alt="Buildings" width="600" height="294" >
    </div>
  </div>
</div>



        
<!-- Team Container -->
<div class="container" id="team" style="text-align: center;padding-bottom: 60px;">
<h2>NOSSA EQUIPE</h2>
<p>Conheça a nossa equipe:</p>

<div class="row" id="equipe"><br>

<!--<div class="col-md-3">
  <img src="images/alan.jpg" alt="Boss" style="width:45%" class="img-circle ">
  <h3>Allan</h3>
  <p></p>
</div>-->

<div class="col-md-4">
  <img src="images/henrique.jpg" alt="Boss" style="width:45%" class="img-circle">
  <h3>Henrique</h3>
  <p></p>
</div>

<div class="col-md-4">
  <img src="images/murilo.jpg" alt="Boss" style="width:45%" class="img-circle">
  <h3>Murilo Xavier</h3>
  <p></p>
</div>

<div class="col-md-4">
  <img src="images/rodrigo.png" alt="Boss" style="width:45%" class="img-circle" border="1">
  <h3>Rodrigo Corneta</h3>
  <p></p>
</div>

</div>
</div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
