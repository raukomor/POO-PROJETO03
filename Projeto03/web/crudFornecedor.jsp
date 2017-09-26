<%-- 
    Document   : crudFornecedor
    Created on : 26/09/2017, 00:25:23
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
        <title>Controle de Fornecedores</title>
    </head>
    <body>
        <% 
            try{
                boolean isError = false;
                if(request.getParameter("add") != null){
                    PessoaJuridica fornecedor = new PessoaJuridica();
                    if (fornecedor.setNome(
                            request.getParameter("name")) == false)
                        isError = true;
                    
                    if (fornecedor.setCnpj(
                            request.getParameter("cnpj")) == false)
                        isError = true;
                    
                    if (fornecedor.setEmail(
                            request.getParameter("email")) == false)
                        isError = true;
                    
                    if (fornecedor.setEndereco(
                            request.getParameter("endereco")) == false)
                        isError = true;
                    
                    if (fornecedor.setTelefone(
                            request.getParameter("telephone")) == false)
                        isError = true;
                    
                    if (fornecedor.setRazaoSocial(
                            request.getParameter("razaoSocial")) == false)
                        isError = true;
                    

                    if (isError) {
                        for (String erroMessage : fornecedor.getMessageErro()) {
                            out.print("<script>");
                            out.print("alert('" + erroMessage + "');");
                            out.print("</script>");
                        }
                    } else {
                        Bd.getFornecedores().add(fornecedor);
                    }
                }else if(request.getParameter("remove") != null){
                    int i = Integer.parseInt(request.getParameter("i"));
                    Bd.getFornecedores().remove(i);
                }
            }catch(Exception ex){ %>
                <script>
                    alert(<%=ex.getMessage()%>);
                </script>
            <%}%>
        <h1>Cadastros efetuados</h1>
        <table border="1">
            <tr>
                <th>Indice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Razão Social</th>
                <th>CNPJ</th>
                <th>-</th>
                <th>-</th>
            </tr>
            <% for(int i = 0; i < Bd.getFornecedores().size(); i++){ %>
            <% PessoaJuridica fornecedor = Bd.getFornecedores().get(i); %>
            <tr>
                <td><%=i%></td>
                <td><%=fornecedor.getNome()%></td>
                <td><%=fornecedor.getEmail()%></td>
                <td><%=fornecedor.getTelefone()%></td>
                <td><%=fornecedor.getEndereco()%></td>
                <td><%=fornecedor.getRazaoSocial()%></td>
                <td><%=fornecedor.getCnpj()%></td>
                <td>
                    <form method="post" action="editFornecedor.jsp">
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="edit" value="Editar"/>
                    </form>
                </td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="remove" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <h1>Cadastrar Fornecedor</h1>
        <fieldset>
            <legend>Adicionar Fornecedor</legend>
            <form>
                <label for="name">Digite seu nome: </label><br/>
                <input type="text" required name="name"/><br/>
                <label for="email">Digite seu email: </label><br/>
                <input type="email" required name="email"/><br/>
                <label for="telephone">Digite seu telefone: </label><br/>
                <input type="number" required name="telephone"/><br/>
                <label for="endereco">Digite seu endereço: </label><br/>
                <input type="text" required name="endereco"/><br/>
                <label for="razaoSocial">Digite sua razão social: </label><br/>
                <input type="text" required name="razaoSocial"/><br/>
                <label for="cnpj">Digite seu cnpj: </label><br/>
                <input type="text" required name="cnpj"/><br/>
                <input type="submit" name="add" value="Cadastrar"/>
            </form>
        </fieldset>
    </body>
</html>
