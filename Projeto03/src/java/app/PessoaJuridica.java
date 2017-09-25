package app;

/**
 *
 * @author hhornos
 */
public class PessoaJuridica extends Pessoa{
    private String razaoSocial;
    private String cnpj;

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public boolean setRazaoSocial(String razaoSocial) {
        if (razaoSocial.isEmpty()) {
            super.setUltimoErro("campo razao social deve conter pelo menos 1 "
                    + "caracter");
            return false;
        }
        super.setUltimoErro("");
        this.razaoSocial = razaoSocial;
        return true;
    }

    public String getCnpj() {
        return cnpj;
    }

    public boolean setCnpj(String cnpj) {
        if (cnpj.isEmpty()) {
            super.setUltimoErro("campo cjpj incorreto");
            return false;
        }
        super.setUltimoErro("");
        this.cnpj = cnpj;
        return true;
    }
}
