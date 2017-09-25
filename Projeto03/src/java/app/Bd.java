package app;

import java.util.ArrayList;

/**
 *
 * @author hhornos
 */
public class Bd {
    private static ArrayList<PessoaFisica> clientes;
    private static ArrayList<PessoaJuridica> fornecedores;
    
    public static ArrayList<PessoaFisica> getClientes() {
        if (clientes==null) {
            clientes = new ArrayList<>();
        }
        return clientes;
    }
    
    public static ArrayList<PessoaJuridica> getFornecedores() {
        if (fornecedores==null) {
            fornecedores = new ArrayList<>();
        }
        return fornecedores;
    }
}
