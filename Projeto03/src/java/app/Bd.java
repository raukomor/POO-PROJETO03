package app;

import java.util.ArrayList;

/**
 *
 * @author hhornos
 */
public class Bd {
    private static ArrayList<PessoaFisica> cliente;
    private static ArrayList<PessoaJuridica> fornecedor;
    
    public static ArrayList<PessoaFisica> getClientes() {
        if (cliente==null) {
            cliente = new ArrayList<>();
        }
        return cliente;
    }
    
    public static ArrayList<PessoaJuridica> getFornecedores() {
        if (fornecedor==null) {
            fornecedor = new ArrayList<>();
        }
        return fornecedor;
    }
}
