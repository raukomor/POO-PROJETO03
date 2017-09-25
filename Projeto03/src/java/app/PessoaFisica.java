package app;

/**
 *
 * @author hhornos
 */
public class PessoaFisica extends Pessoa{
    private String cpf;
    private String rg;

    public String getCpf() {
        return cpf;
    }

    public boolean setCpf(String cpf) {
        if (cpf.isEmpty()) {
            super.setUltimoErro("campo email incorreto");
            return false;
        }
        super.setUltimoErro("");
        this.cpf = cpf;
        return true;
    }

    public String getRg() {
        return rg;
    }

    public boolean setRg(String rg) {
        if (rg.isEmpty()) {
            super.setUltimoErro("campo RG incorreto");
            return false;
        }
        super.setUltimoErro("");
        this.rg = rg;
        return true;
    }
}
