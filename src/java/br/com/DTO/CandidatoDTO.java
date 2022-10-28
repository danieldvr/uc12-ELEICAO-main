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
public class CandidatoDTO {
    
    private Integer tituloEleitoral;
    private Integer numeroCandidato;
    private Character situacao;

    /**
     * @return the tituloEleitoral
     */
    public Integer getTituloEleitoral() {
        return tituloEleitoral;
    }

    /**
     * @param tituloEleitoral the tituloEleitoral to set
     */
    public void setTituloEleitoral(Integer tituloEleitoral) {
        this.tituloEleitoral = tituloEleitoral;
    }

    /**
     * @return the numeroCandidato
     */
    public Integer getNumeroCandidato() {
        return numeroCandidato;
    }

    /**
     * @param numeroCandidato the numeroCandidato to set
     */
    public void setNumeroCandidato(Integer numeroCandidato) {
        this.numeroCandidato = numeroCandidato;
    }

    /**
     * @return the situacao
     */
    public Character getSituacao() {
        return situacao;
    }

    /**
     * @return the situacao
     */
    public String getSituacaoDetalhada() {
        String situacaoDetalhada = "";
        if(situacao == 'A'){
            return "Aprovado";
        }
        else if(situacao == 'P'){
            return "Pendente";
        }
        else {
            return "Negado";
        }
    }

    /**
     * @param situacao the situacao to set
     */
    public void setSituacao(Character situacao) {
        this.situacao = situacao;
    }

    @Override
    public String toString() {
        return "CandidatoDTO{" + "tituloEleitoral=" + tituloEleitoral + ", numeroCandidato=" + numeroCandidato + ", situacao=" + situacao + '}';
    }
    
    
}
