package br.com.fatecpg.cadastro;
import app.ValidaDados;
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
        for(PessoaJuridica objeto : fornecedores){
            if(objeto.getCnpj().equals(fornecedor.getCnpj())){
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
}
