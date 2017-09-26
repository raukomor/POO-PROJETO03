/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

/**
 *
 * @author hhornos
 */
public class ValidaDados {
    private static final int[] PESO_CPF = {11, 10, 9, 8, 7, 6, 5, 4, 3, 2};
    private static final int[] PESO_CNPJ = {6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
    
    private static int calculaDigito(String str, int[] peso) {
        int soma = 0;
        for (int i = str.length() - 1, digito; i >= 0; i--) {
           digito = Integer.parseInt(str.substring(i,i + 1));
           soma += digito * peso[peso.length - str.length() + i];
        }
        soma = 11 - soma % 11;
        return soma > 9 ? 0 : soma;
   }
    
    public static boolean Cnpj(String cnpj) {
       Integer dig1;
       Integer dig2;
       
        if ((cnpj == null) || (cnpj.length() != 14))
            return false;

        dig1 = calculaDigito(cnpj.substring(0,12), PESO_CNPJ);
        dig2 = calculaDigito(cnpj.substring(0,12) + dig1, PESO_CNPJ);
        
        return cnpj.equals(cnpj.substring(0,12)
                + dig1.toString() + dig2.toString());
    }
    
    public static boolean Cpf(String cpf) {
        Integer dig1;
        Integer dig2;
        
        if ((cpf == null) || (cpf.length() != 11))
            return false;

        dig1 = calculaDigito(cpf.substring(0,9), PESO_CPF);
        dig2 = calculaDigito(cpf.substring(0,9) + dig1, PESO_CPF);
        
        return cpf.equals(cpf.substring(0,9)
                + dig1.toString() + dig2.toString());
   }
}
