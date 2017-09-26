package br.com.fatecpg.cadastro;

import app.ValidaDados;

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
            super.setUltimoErro("Por favor digite um CPF, está em branco!!!");
            return false;
        } else if (ValidaDados.Cpf(cpf) == false) {
            super.setUltimoErro("Número de CPF inválido");
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
            super.setUltimoErro("Por favor digite um RG, está em branco!!!");
            return false;
        }
        super.setUltimoErro("");
        this.rg = rg;
        return true;
    }
}
