package br.com.fatecpg.cadastro;

import java.util.ArrayList;

/**
 *
 * @author hhornos
 */
public abstract class Pessoa {
    private String nome;
    private String email;
    private String telefone;
    private String endereco;
    private final ArrayList<String> errorList = new ArrayList<>();
    
    public String getNome() {
        return nome;
    }

    public boolean setNome(String nome) {
        if (nome.isEmpty()) {
            this.errorList.add("campo nome deve conter pelo menos 1 caracter");
            return false;
        }
        
        this.nome = nome;
        return true;
    }

    public String getEmail() {
        return email;
    }

    public boolean setEmail(String email) {
        if (email.isEmpty()) {
            this.errorList.add("Cadê o email? Digita ele...");
            return false;
        } else if (!email.contains("@") && email.charAt(1) != '@' ) {
            this.errorList.add("campo email incorreto, cadê o @?");
            return false;
        } else if (email.charAt(1) == '@' ) {
            this.errorList.add("campo email incorreto, email começando com @? "
                    + "Corrige isso por favor, tá errado!");
            return false;
        } else if (email.charAt(email.length() -1) == '@') {
            this.errorList.add("campo email incorreto, email terminando com @? "
                    + "Corrige isso por favor, tá errado!");
            return false;
        }

        this.email = email;
        return true;
    }

    public String getTelefone() {
        return telefone;
    }

    public boolean setTelefone(String telefone) {
        if (telefone.isEmpty()) {
            this.errorList.add("Cadê o telefone? Digite ele.");
            return false;
        } else if (telefone.length() < 10 || telefone.length() > 11
                || telefone.matches("\\D")) {
            this.errorList.add("Numero telefone inválido? telefone deve conter "
                    + "DDD com dois digitos e o numero com 8 ou 9 digitos, "
                    + "ahh apenas números por favor.");
            return false;
        }

        this.telefone = telefone;
        return true;
    }
    
    public String getEndereco() {
        return endereco;
    }
    
    public boolean setEndereco(String endereco) {
        if (endereco.isEmpty()) {
            this.errorList.add("campo endereço deve conter ao menos 1 caractér");
            return false;
        }

        this.endereco = endereco;
        return true;
    }
    
    public ArrayList<String> getMessageErro(){
        return this.errorList;
    }
    
    public void setUltimoErro(String lastError){
        this.errorList.add(lastError);
    }
}
