package br.com.fatecpg.cadastro;

import app.ValidaDados;

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
        this.razaoSocial = razaoSocial;
        return true;
    }

    public String getCnpj() {
        return cnpj;
    }

    public boolean setCnpj(String cnpj) {
        if (cnpj.isEmpty()) {
            super.setUltimoErro("Por favor digite um CNPJ, está em branco!!!");
            return false;
        } else if (ValidaDados.Cnpj(cnpj) == false) {
            super.setUltimoErro("Número de CNPJ inválido!!!");
            return false;
        }
        this.cnpj = cnpj;
        return true;
    }
}
