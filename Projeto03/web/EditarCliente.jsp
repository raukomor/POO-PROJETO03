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
        <title>JSP Page</title>
    </head>
    <body>
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
        <fieldset>
            <legend>Editar Fornecedor (<%=pessoaFisica.getNome()%>)</legend>
            <form>
                <label for="name">Digite seu nome: </label><br/>
                <input type="text" name="name" placeholder="<%=pessoaFisica.getNome()%>" value="<%=pessoaFisica.getNome()%>"/><br/>
                <label for="email">Digite seu email: </label><br/>
                <input type="email" name="email" placeholder="<%=pessoaFisica.getEmail()%>" value="<%=pessoaFisica.getEmail()%>"/><br/>
                <label for="telephone">Digite seu telefone: </label><br/>
                <input type="number" name="telephone" placeholder="<%=pessoaFisica.getTelefone()%>" value="<%=pessoaFisica.getTelefone()%>"/><br/>
                <label for="endereco">Digite seu endereço: </label><br/>
                <input type="text" name="endereco" placeholder="<%=pessoaFisica.getEndereco()%>" value="<%=pessoaFisica.getEndereco()%>"/><br/>
                <label for="rg">Digite seu RG: </label><br/>
                <input type="text" name="rg" placeholder="<%=pessoaFisica.getRg()%>" value="<%=pessoaFisica.getRg()%>"/><br/>
                <label for="cpf">Digite seu CPF: </label><br/>
                <input type="text" name="cpf" placeholder="<%=pessoaFisica.getCpf()%>" value="<%=pessoaFisica.getCpf()%>"/><br/>
                <input type="hidden" name="i" value="<%=Integer.parseInt(request.getParameter("i"))%>"/>
                <input type="submit" name="editar" value="Alterar"/>
            </form>
        </fieldset>
        <%}else if(isNotCompleted){%>
            <h1>Ocorreu um erro ao editar seus dados.</h1>
            <a href="CadastroCliente.jsp">Voltar</a>
        <%}else{%>
            <h1>Alteração efetuada com sucesso!</h1>
            <a href="CadastroCliente.jsp">Voltar</a>
        <<%}%>
    </body>
</html>
