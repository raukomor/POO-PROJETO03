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
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        
        <script src="js/jquery-3.2.1.js" defer="defer"></script>
        <script src="js/bootstrap.min.js" defer="defer"></script>
        
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
                        if(!Bd.addFornecedor(fornecedor)){
                            out.print("<script>");
                            out.print("alert('Já existe um cadastro com este CNPJ');");
                            out.print("</script>");
                        }
                    }
                }else if(request.getParameter("remove") != null){
                    int i = Integer.parseInt(request.getParameter("i"));
                    Bd.removeFornecedor(i);
                }
            }catch(Exception ex){ %>
                <script>
                    alert(<%=ex.getMessage()%>);
                </script>
            <%}%>
        <h1>Cadastros efetuados</h1>
        <table class="table table-bordered table-striped" >
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
            <% for(int i = 0; i < Bd.totalCadastrosFornecedor(); i++){ %>
            <% PessoaJuridica fornecedor = Bd.obterFornecedor(i); %>
            <tr>
                <td><%=i%></td>
                <td><%=fornecedor.getNome()%></td>
                <td><%=fornecedor.getEmail()%></td>
                <td><%=fornecedor.getTelefone()%></td>
                <td><%=fornecedor.getEndereco()%></td>
                <td><%=fornecedor.getRazaoSocial()%></td>
                <td><%=fornecedor.getCnpj()%></td>
                <td>
                    <form method="post" action="EditarFornecedor.jsp">
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input class="btn btn-default" type="submit" name="edit" value="Editar"/>
                    </form>
                </td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input class="btn btn-default" type="submit" name="remove" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <h1>Cadastrar Fornecedor</h1>
        <fieldset class="container-fluid" style="background-color: rgb(230,230,230);border-radius: 5px;border: 1px solid rgb(180,180,180); padding: 30px; margin-bottom: 20px; ">
            <!--<legend>Adicionar Fornecedor</legend>-->
            <form>
                <label for="name">Digite seu nome: </label><br/>
                <input class="form-control" type="text" required name="name"/><br/>
                <label for="email">Digite seu email: </label><br/>
                <input class="form-control" type="email" required name="email"/><br/>
                <label for="telephone">Digite seu telefone: </label><br/>
                <input class="form-control" type="number" required name="telephone"/><br/>
                <label for="endereco">Digite seu endereço: </label><br/>
                <input class="form-control" type="text" required name="endereco"/><br/>
                <label for="razaoSocial">Digite sua razão social: </label><br/>
                <input class="form-control" type="text" required name="razaoSocial"/><br/>
                <label for="cnpj">Digite seu CNPJ: </label><br/>
                <input class="form-control" type="text" required name="cnpj"/><br/>
                <input class="btn btn-default" type="submit" name="add" value="Cadastrar"/>
            </form>
        </fieldset>
    </div> 
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
