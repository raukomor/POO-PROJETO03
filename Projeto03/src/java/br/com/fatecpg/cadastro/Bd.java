package br.com.fatecpg.cadastro;
import java.util.ArrayList;

/**
 *
 * @author hhornos
 */
public class Bd {
    private static ArrayList<PessoaFisica> clientes;
    private static ArrayList<PessoaJuridica> fornecedores;
    
    private static ArrayList<PessoaFisica> getClientes() {
        if (clientes==null) {
            clientes = new ArrayList<>();
        }
        return clientes;
    }
    
    private static ArrayList<PessoaJuridica> getFornecedores() {
        if (fornecedores==null) {
            fornecedores = new ArrayList<>();
        }
        return fornecedores;
    }
    public static boolean addFornecedor(PessoaJuridica fornecedor){
        for (PessoaJuridica f : getFornecedores()){
            if(f.getCnpj().equals(fornecedor.getCnpj())){
                return false;
            }
        }
        Bd.getFornecedores().add(fornecedor);
        return true;
    }
    public static void editFornecedor(int indice, PessoaJuridica fornecedor){
        Bd.getFornecedores().remove(indice);
        Bd.getFornecedores().add(indice, fornecedor);
    }
    public static void removeFornecedor(int indice){
        Bd.getFornecedores().remove(indice);
    }
    public static Integer totalCadastrosFornecedor(){
        return Bd.getFornecedores().size();
    }
    public static PessoaJuridica obterFornecedor(int i){
        return Bd.getFornecedores().get(i);
    }
        public static boolean addPessoaFisica(PessoaFisica pessoaFisica){
        for(PessoaFisica f : clientes){
            if(f.getCpf().equals(pessoaFisica.getCpf())){
                return false;
            }
        }
        Bd.getClientes().add(pessoaFisica);
        return true;
    }
    public static void editPessoaFisica(int indice, PessoaFisica pessoaFisica){
        Bd.getClientes().remove(indice);
        Bd.getClientes().add(indice, pessoaFisica);
    }
    public static void removePessoaFisica(int indice){
        Bd.getClientes().remove(indice);
    }
    public static Integer totalCadastrosPessoaFisica(){
        return Bd.getClientes().size();
    }
    public static PessoaFisica obterPessoaFisica(int i){
        return Bd.getClientes().get(i);
    }
}
