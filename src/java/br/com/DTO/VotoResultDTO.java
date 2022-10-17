/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DTO;

/**
 *
 * @author sala19a
 */
public class VotoResultDTO {

    private String nomeCandidato;
    private Integer qntVotos;

    /**
     * @return the nomeCandidato
     */
    public String getNomeCandidato() {
        return nomeCandidato;
    }

    /**
     * @param nomeCandidato the nomeCandidato to set
     */
    public void setNomeCandidato(String nomeCandidato) {
        this.nomeCandidato = nomeCandidato;
    }

    /**
     * @return the qntVotos
     */
    public Integer getQntVotos() {
        return qntVotos;
    }

    /**
     * @param qntVotos the qntVotos to set
     */
    public void setQntVotos(Integer qntVotos) {
        this.qntVotos = qntVotos;
    }
    
    

}
