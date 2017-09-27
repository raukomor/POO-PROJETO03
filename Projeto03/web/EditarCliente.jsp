<%-- 
    Document   : editFornecedor
    Created on : 26/09/2017, 01:12:00
    Author     : Muca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="br.com.fatecpg.cadastro.Bd"%>
        <%@page import="br.com.fatecpg.cadastro.Pessoa"%>
        <%@page import="br.com.fatecpg.cadastro.PessoaFisica"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Controle de clientes</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <script type="text/javascript">
            document.getElementById("home").className = "";
            document.getElementById("about").className = "hide";
            document.getElementById("team").className = "hide";
        </script>
        <div class="container">
        <%  
            int i = Integer.parseInt(request.getParameter("i"));
            PessoaFisica pessoaFisica = Bd.obterPessoaFisica(i);
            boolean isNotCompleted = false;
            try{
                boolean isError = false;
                if(request.getParameter("editar") != null){
                    if (pessoaFisica.setNome(
                            request.getParameter("name")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (pessoaFisica.setCpf(
                            request.getParameter("cpf")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (pessoaFisica.setEmail(
                            request.getParameter("email")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (pessoaFisica.setEndereco(
                            request.getParameter("endereco")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (pessoaFisica.setTelefone(
                            request.getParameter("telephone")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (pessoaFisica.setRg(
                            request.getParameter("rg")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (isError) {
                        for (String erroMessage : pessoaFisica.getMessageErro()) {
                            out.print("<script>");
                            out.print("alert('" + erroMessage + "');");
                            out.print("</script>");
                        }
                    } else {
                        Bd.editPessoaFisica(i, pessoaFisica);
                        
                    }
                }
            }catch(Exception ex){%>
                <script>
                    alert(<%=ex.getMessage()%>);
                </script>
            <%}%>
        <%if(request.getParameter("editar") == null){%>
        <fieldset  class="container-fluid" style="background-color: rgb(230,230,230);border-radius: 5px;border: 1px solid rgb(180,180,180); padding: 30px; margin-bottom: 20px; ">
            <h3 style="margin-bottom: 50px;">Editar Fornecedor (<%=pessoaFisica.getNome()%>)</h3>
            <form>
                <label for="name">Digite seu nome: </label><br/>
                <input class="form-control" type="text" name="name" placeholder="<%=pessoaFisica.getNome()%>" value="<%=pessoaFisica.getNome()%>"/><br/>
                <label for="email">Digite seu email: </label><br/>
                <input class="form-control" type="email" name="email" placeholder="<%=pessoaFisica.getEmail()%>" value="<%=pessoaFisica.getEmail()%>"/><br/>
                <label for="telephone">Digite seu telefone: </label><br/>
                <input class="form-control" type="number" name="telephone" placeholder="<%=pessoaFisica.getTelefone()%>" value="<%=pessoaFisica.getTelefone()%>"/><br/>
                <label for="endereco">Digite seu endereço: </label><br/>
                <input class="form-control" type="text" name="endereco" placeholder="<%=pessoaFisica.getEndereco()%>" value="<%=pessoaFisica.getEndereco()%>"/><br/>
                <label for="rg">Digite seu RG: </label><br/>
                <input class="form-control" type="text" name="rg" placeholder="<%=pessoaFisica.getRg()%>" value="<%=pessoaFisica.getRg()%>"/><br/>
                <label for="cpf">Digite seu CPF: </label><br/>
                <input class="form-control" type="text" name="cpf" placeholder="<%=pessoaFisica.getCpf()%>" value="<%=pessoaFisica.getCpf()%>"/><br/>
                <input type="hidden" name="i" value="<%=Integer.parseInt(request.getParameter("i"))%>"/>
                <input class="btn btn-default" type="submit" name="editar" value="Alterar"/>
            </form>
        </fieldset>
        <%}else if(isNotCompleted){%>
            <h1>Ocorreu um erro ao editar seus dados.</h1>
            <a href="CadastroCliente.jsp"><button class="btn btn-default">Voltar</button></a>
        <%}else{%>
            <h1>Alteração efetuada com sucesso!</h1>
            <a href="CadastroCliente.jsp"><button class="btn btn-default">Voltar</button></a>
        <%}%>
        </div> 
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
