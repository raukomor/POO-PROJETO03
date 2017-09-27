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
        <%@page import="br.com.fatecpg.cadastro.PessoaJuridica"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            int i = Integer.parseInt(request.getParameter("i"));
            PessoaJuridica fornecedor = Bd.obterFornecedor(i);
            boolean isNotCompleted = false;
            try{
                boolean isError = false;
                if(request.getParameter("editar") != null){
                    if (fornecedor.setNome(
                            request.getParameter("name")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (fornecedor.setCnpj(
                            request.getParameter("cnpj")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (fornecedor.setEmail(
                            request.getParameter("email")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (fornecedor.setEndereco(
                            request.getParameter("endereco")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (fornecedor.setTelefone(
                            request.getParameter("telephone")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (fornecedor.setRazaoSocial(
                            request.getParameter("razaoSocial")) == false){
                        isError = true;
                        isNotCompleted = true;
                    }
                    if (isError) {
                        for (String erroMessage : fornecedor.getMessageErro()) {
                            out.print("<script>");
                            out.print("alert('" + erroMessage + "');");
                            out.print("</script>");
                        }
                    } else {
                        Bd.editFornecedor(i, fornecedor);
                        
                    }
                }
            }catch(Exception ex){%>
                <script>
                    alert(<%=ex.getMessage()%>);
                </script>
            <%}%>
        <%if(request.getParameter("editar") == null){%>
        <fieldset>
            <legend>Editar Fornecedor (<%=fornecedor.getNome()%>)</legend>
            <form>
                <label for="name">Digite seu nome: </label><br/>
                <input type="text" name="name" placeholder="<%=fornecedor.getNome()%>" value="<%=fornecedor.getNome()%>"/><br/>
                <label for="email">Digite seu email: </label><br/>
                <input type="email" name="email" placeholder="<%=fornecedor.getEmail()%>" value="<%=fornecedor.getEmail()%>"/><br/>
                <label for="telephone">Digite seu telefone: </label><br/>
                <input type="number" name="telephone" placeholder="<%=fornecedor.getTelefone()%>" value="<%=fornecedor.getTelefone()%>"/><br/>
                <label for="endereco">Digite seu endereço: </label><br/>
                <input type="text" name="endereco" placeholder="<%=fornecedor.getEndereco()%>" value="<%=fornecedor.getEndereco()%>"/><br/>
                <label for="razaoSocial">Digite sua razão social: </label><br/>
                <input type="text" name="razaoSocial" placeholder="<%=fornecedor.getRazaoSocial()%>" value="<%=fornecedor.getRazaoSocial()%>"/><br/>
                <label for="cnpj">Digite seu cnpj: </label><br/>
                <input type="text" name="cnpj" placeholder="<%=fornecedor.getCnpj()%>" value="<%=fornecedor.getCnpj()%>"/><br/>
                <input type="hidden" name="i" value="<%=Integer.parseInt(request.getParameter("i"))%>"/>
                <input type="submit" name="editar" value="Alterar"/>
            </form>
        </fieldset>
        <%}else if(isNotCompleted){%>
            <h1>Ocorreu um erro ao editar seus dados.</h1>
            <a href="crudFornecedor.jsp">Voltar</a>
        <%}else{%>
            <h1>Alteração efetuada com sucesso!</h1>
            <a href="crudFornecedor.jsp">Voltar</a>
        <<%}%>
    </body>
</html>
