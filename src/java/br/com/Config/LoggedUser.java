/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Config;

import br.com.DTO.EleitorDTO;

/**
 *
 * @author CAIO-PC
 */
public class LoggedUser {
    private static EleitorDTO usuario = new EleitorDTO();
    
    public static void setEleitor(EleitorDTO eleitor){
        usuario = eleitor;
    }
    
    public static EleitorDTO getEleitor(){
        return usuario;
    }
}
