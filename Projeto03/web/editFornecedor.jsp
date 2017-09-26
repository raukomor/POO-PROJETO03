<%-- 
    Document   : editFornecedor
    Created on : 26/09/2017, 01:12:00
    Author     : Muca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="app.Bd"%>
        <%@page import="app.Pessoa"%>
        <%@page import="app.PessoaJuridica"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  int i = Integer.parseInt(request.getParameter("i"));
            PessoaJuridica fornecedor = Bd.getFornecedores().get(i);
            try{
                if(request.getParameter("editar") != null){
                    fornecedor = Bd.getFornecedores().remove(i);
                    fornecedor.setNome(request.getParameter("name"));
                    fornecedor.setEmail(request.getParameter("email"));
                    fornecedor.setTelefone(request.getParameter("telephone"));
                    fornecedor.setEndereco(request.getParameter("endereco"));
                    fornecedor.setRazaoSocial(request.getParameter("razaoSocial"));
                    fornecedor.setCnpj(request.getParameter("cnpj"));
                    Bd.getFornecedores().add(i, fornecedor);
                }
            }catch(Exception ex){%>
                <script>
                    window.alert(<%=fornecedor.getUltimoErro()%>);
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
        <%}else{%>
        <h1>Alteração efetuada com sucesso!</h1>
        <a href="crudFornecedor.jsp">Voltar</a>
        <%}%>
    </body>
</html>
