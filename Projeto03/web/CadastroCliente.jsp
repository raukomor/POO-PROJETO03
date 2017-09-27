<%-- 
    Document   : CadastroCliente
    Created on : 25/09/2017, 23:53:34
    Author     : rodri
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="app.ValidaDados"%>
<%@page import="br.com.fatecpg.cadastro.Bd"%>
<%@page import="br.com.fatecpg.cadastro.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
        
        <h1>Cadastro de Clientes</h1>
        <%
        try{
            if(request.getParameter("add") != null){
                PessoaFisica c = new PessoaFisica();
                //Bd bd = new Bd();
                boolean isError = false;
                String nome = request.getParameter("txtNome");
                String cpf = request.getParameter("txtCpf");
                String rg = request.getParameter("txtRg");
                String email = request.getParameter("txtEmail");
                String telefone = request.getParameter("txtTelefone");
                String endereco = request.getParameter("txtEndereco");
                
                
                
                if(!c.setNome(nome)){
                      isError = true;
                      
                }

                if(!c.setCpf(cpf)){
                    isError = true;
                }
//
                if(!c.setRg(rg)){
                    isError = true;
                }
//
                if(!c.setEmail(email)){
                    isError = true;
                }
//
                if(!c.setTelefone(telefone)){
                    isError = true;
                }
//
                if(!c.setEndereco(endereco)){
                    isError = true;
                }
                
                    
//                c.setNome(nome);
//                c.setCpf(cpf);
//                c.setRg(rg);
//                c.setEmail(email);
//                c.setTelefone(telefone);
//                c.setEndereco(endereco);  
                    
                    if (isError) {
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert(");
                        for (String erroMessage : c.getMessageErro()) {
                            
                             //out.print(erroMessage + "");
                               %>"<%=erroMessage%>" + "\n" +<%  
                            
                        }
                        out.print("\"\");</script>");
                    } else {
                        
                        Bd.getClientes().add(c);
                    }
            }
        %>
        <%}catch(Exception ex){%>
        <div>*Erro ao processar o comando: <%=ex.getMessage()%></div>
        <%}%>
        <h1>Cadastros efetuados</h1>
        <table border="1">
            <tr>
                <th>Indice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>CPF</th>
                <th>RG</th>
                
            </tr>
            <% for(int i = 0; i < Bd.getClientes().size(); i++){ %>
            <% PessoaFisica pessoaFisica = Bd.getClientes().get(i); %>
            <tr>
                <td><%=i%></td>
                <td><%=pessoaFisica.getNome()%></td>
                <td><%=pessoaFisica.getEmail()%></td>
                <td><%=pessoaFisica.getTelefone()%></td>
                <td><%=pessoaFisica.getEndereco()%></td>
                <td><%=pessoaFisica.getCpf()%></td>
                <td><%=pessoaFisica.getRg()%></td>
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
        
            <fieldset id="teste">
                <legend>Cadastro de Clientes</legend>
                <form >
                    <label for="txtNome" >Nome:</label></br>
                    <input type="text" name="txtNome" autofocus</br></br>
                    <label for="txtCpf" >CPF:</label></br>
                    <input type="text" name="txtCpf"></br></br>
                    <label for="txtRg" >RG:</label></br>
                    <input type="text" name="txtRg"></br></br>
                    <label for="txtEmail" >E-Mail:</label></br>
                    <input type="text" name="txtEmail"></br></br>
                    <label for="txtTelefone" >Telefone:</label></br>
                    <input type="text" name="txtTelefone"></br></br>
                    <label for="textEndereco" >Endereço:</label></br>
                    <input type="text" name="txtEndereco"></br></br>
                    </br>
                    <input type="submit" name="add"  value="Cadastrar"></br>
                </form>
            </fieldset>
            
           <script type="text/javascript" defer="defer">
                //alert(document.getElementById("teste").offsetTop);
                //window.scrollTo(0,document.getElementById("teste").offsetTop);
            </script> 
    </body>
</html>
