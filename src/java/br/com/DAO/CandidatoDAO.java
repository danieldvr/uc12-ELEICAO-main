/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.DTO.CandidatoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sala19a
 */
public class CandidatoDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public ArrayList<CandidatoDTO> pesquisarCandidato() throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        ArrayList<CandidatoDTO> lista = new ArrayList();

        try {
            ps = con.prepareStatement("select * from candidato");
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(this.preencherCandidato(rs));
            }

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return lista;

    }

    public CandidatoDTO pesquisarCandidatoPorTitulo(Integer tituloEleitoral) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        CandidatoDTO objCandidatoDTO = new CandidatoDTO();

        try {
            ps = con.prepareStatement("select * from candidato WHERE titulo_eleitoral_eleitor = ?");
            ps.setInt(1, tituloEleitoral);
            rs = ps.executeQuery();

            while (rs.next()) {
                return this.preencherCandidato(rs);
            }
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return null;

    }

    public void cadastrarCandidato(CandidatoDTO objCandidato) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();

        try {
            ps = con.prepareStatement("insert into candidato(titulo_eleitoral_eleitor, numero_candidato, imagem, situacao)values(?, ?, ?, ?)");
            ps.setInt(1, objCandidato.getTituloEleitoral());
            ps.setInt(2, objCandidato.getNumeroCandidato());
            ps.setString(3, objCandidato.getImagem());
            ps.setString(4, objCandidato.getSituacao().toString());
            ps.execute();

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluirCandidato(CandidatoDTO objNumeroCandidato) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();

        try {
            ps = con.prepareStatement("delete from candidato where numero_candidato = ?");
            ps.setInt(1, objNumeroCandidato.getNumeroCandidato());
            ps.execute();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterarCandidato(CandidatoDTO objCandidato) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();

        try {
            ps = con.prepareStatement("update candidato set titulo_eleitoral_eleitor=? where numero_candidato = ?");
            ps.setInt(1, objCandidato.getTituloEleitoral());
            ps.setInt(2, objCandidato.getNumeroCandidato());
            ps.setString(3, objCandidato.getImagem());
            ps.setString(4, objCandidato.getSituacao().toString());

            ps.execute();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public CandidatoDTO preencherCandidato(ResultSet rs) throws SQLException {
        CandidatoDTO objCandidatoDTO = new CandidatoDTO();
        objCandidatoDTO.setNumeroCandidato(rs.getInt("numero_candidato"));
        objCandidatoDTO.setTituloEleitoral(rs.getInt("titulo_eleitoral_eleitor"));
        objCandidatoDTO.setImagem(rs.getString("imagem"));
        objCandidatoDTO.setSituacao(rs.getString("situacao").charAt(0));

        return objCandidatoDTO;
    }

}
