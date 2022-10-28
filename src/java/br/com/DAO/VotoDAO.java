/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.DTO.EleitorDTO;
import br.com.DTO.VotoDTO;
import br.com.DTO.VotoResultDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sala19a
 */
public class VotoDAO {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public void votarCandidato(VotoDTO objVoto) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        
        try {
            ps = con.prepareStatement("INSERT INTO voto (titulo_eleitoral_eleitor, numero_candidato) values (?, ?);");
            ps.setInt(1, objVoto.getTituloEleitoralEleitor());
            ps.setInt(2, objVoto.getNumeroCandidato());
            ps.execute();
            
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Integer contarTodos() throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        int resultado = 0;
        
        try {
            ps = con.prepareStatement("SELECT COUNT(*) from voto");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                resultado = rs.getInt("COUNT(*)");
            }
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return resultado;
    }
    
    public Integer contarVotoPorCandidato(Integer numeroDoCandidato) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        int resultado = 0;
        
        try {
            ps = con.prepareStatement("SELECT COUNT(*) from voto WHERE numero_candidato = ?");
            ps.setInt(1, numeroDoCandidato);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                resultado = rs.getInt("COUNT(*)");
            }
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return resultado;
    }
    
    public ArrayList<VotoResultDTO> retornarResultado() throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        ArrayList<VotoResultDTO> lista = new ArrayList();
        
        try {
            ps = con.prepareStatement("SELECT eleitor.nome, count(*) as votos FROM voto\n"
                    + "lEFT JOIN candidato ON (voto.numero_candidato = candidato.numero_candidato)\n"
                    + "LEFT JOIN eleitor ON (candidato.titulo_eleitoral_eleitor = eleitor.titulo_eleitoral_eleitor)\n"
                    + "group by voto.numero_candidato");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                VotoResultDTO votoResultDTO = new VotoResultDTO();
                votoResultDTO.setNomeCandidato(rs.getString("nome"));
                votoResultDTO.setQntVotos(rs.getInt("votos"));
                
                lista.add(votoResultDTO);
            }
            
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return lista;
    }
    
    public boolean procurarPorTituloEleitoral(Integer tituloEsleitoralEleitor) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        
        try {
            ps = con.prepareStatement("SELECT * from voto WHERE titulo_eleitoral_eleitor = ?");
            ps.setInt(1, tituloEsleitoralEleitor);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                con.close();
                return true;
            }
            
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public void reiniciarEleicao() throws ClassNotFoundException{
        con = new ConexaoDAO().conexaoBD();
        
        try {
            ps = con.prepareStatement("DELETE FROM voto;");
            ps.execute();
            
            ps = con.prepareStatement("DELETE FROM candidato WHERE titulo_eleitoral_eleitor != 0;");
            ps.execute();
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
