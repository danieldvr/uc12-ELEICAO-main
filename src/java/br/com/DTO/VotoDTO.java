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
public class VotoDTO {

    private Integer idVoto;
    private Integer tituloEleitoralEleitor;
    private Integer numeroCandidato;
    
    public Integer getIdVoto() {
        return this.idVoto;
    }

    public void setIdVoto(Integer idVoto){
        this.idVoto = idVoto;
    }

    public Integer getTituloEleitoralEleitor() {
        return this.tituloEleitoralEleitor;
    }

    public void setTituloEleitoralEleitor(Integer titulo) {
        this.tituloEleitoralEleitor = titulo;
    }
    
    public Integer getNumeroCandidato(){
        return this.numeroCandidato;
    }
    
    public void setNumeroCandidato(Integer numeroCandidato){
        this.numeroCandidato = numeroCandidato;
    }

}
