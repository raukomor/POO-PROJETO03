package app;

/**
 *
 * @author hhornos
 */
public abstract class Pessoa {
    private String nome;
    private String email;
    private String telefone;
    private String lastError;

    public String getNome() {
        return nome;
    }

    public boolean setNome(String nome) {
        if (nome.isEmpty()) {
            this.lastError = "campo nome deve conter pelo menos 1 caracter";
            return false;
        }
        
        this.lastError = "";
        this.nome = nome;
        return true;
    }

    public String getEmail() {
        return email;
    }

    public boolean setEmail(String email) {
        if (nome.isEmpty()) {
            this.lastError = "campo email incorreto";
            return false;
        }
        this.lastError = "";
        this.email = email;
        return true;
    }

    public String getTelefone() {
        return telefone;
    }

    public boolean setTelefone(String telefone) {
        if (telefone.isEmpty()) {
            this.lastError = "campo telefone incorreto";
            return false;
        }
        this.lastError = "";
        this.telefone = telefone;
        return true;
    }
    
    public String getUltimoErro(){
        return lastError;
    }
    
    public void setUltimoErro(String lastError){
        this.lastError = lastError;
    }
}
