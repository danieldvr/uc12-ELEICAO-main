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

    public ArrayList<CandidatoDTO> listarCandidatos() throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        ArrayList<CandidatoDTO> lista = new ArrayList();

        try {
            ps = con.prepareStatement("SELECT * FROM candidato");
            rs = ps.executeQuery();

            while (rs.next()) {
                CandidatoDTO objCandidatoDTO = new CandidatoDTO();
                objCandidatoDTO.setNumeroCandidato(rs.getInt("numero_candidato"));
                objCandidatoDTO.setTituloEleitoral(rs.getInt("titulo_eleitoral_eleitor"));
                objCandidatoDTO.setImagem(rs.getBytes("imagem"));
                objCandidatoDTO.setSituacao(rs.getString("situacao").charAt(0));
                lista.add(objCandidatoDTO);
            }

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return lista;

    }

    public ArrayList<CandidatoDTO> listarCandidatosAprovados() throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        ArrayList<CandidatoDTO> lista = new ArrayList();

        try {
            ps = con.prepareStatement("SELECT * FROM candidato WHERE situacao = 'A'");
            rs = ps.executeQuery();

            while (rs.next()) {
                CandidatoDTO objCandidatoDTO = new CandidatoDTO();
                objCandidatoDTO.setNumeroCandidato(rs.getInt("numero_candidato"));
                objCandidatoDTO.setTituloEleitoral(rs.getInt("titulo_eleitoral_eleitor"));
                objCandidatoDTO.setImagem(rs.getBytes("imagem"));
                objCandidatoDTO.setSituacao(rs.getString("situacao").charAt(0));
                lista.add(objCandidatoDTO);
            }

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return lista;

    }

    public CandidatoDTO pesquisarCandidatoAprovadoPorTitulo(Integer tituloEleitoral) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        CandidatoDTO objCandidatoDTO = new CandidatoDTO();

        try {
            ps = con.prepareStatement("select * from candidato WHERE titulo_eleitoral_eleitor = ? AND situacao = 'A'");
            ps.setInt(1, tituloEleitoral);
            rs = ps.executeQuery();

            while (rs.next()) {
                objCandidatoDTO.setNumeroCandidato(rs.getInt("numero_candidato"));
                objCandidatoDTO.setTituloEleitoral(rs.getInt("titulo_eleitoral_eleitor"));
                objCandidatoDTO.setImagem(rs.getBytes("imagem"));
                objCandidatoDTO.setSituacao(rs.getString("situacao").charAt(0));
                
                return objCandidatoDTO;
            }
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return null;

    }

    public CandidatoDTO pesquisarCandidatoPorTitulo(Integer tituloEleitoral) throws ClassNotFoundException {
        con = new ConexaoDAO().conexaoBD();
        CandidatoDTO objCandidatoDTO = new CandidatoDTO();

        try {
            ps = con.prepareStatement("select * from candidato WHERE titulo_eleitoral_eleitor = ?");
            ps.setInt(1, tituloEleitoral);
            rs = ps.executeQuery();

            while (rs.next()) {
                objCandidatoDTO.setNumeroCandidato(rs.getInt("numero_candidato"));
                objCandidatoDTO.setTituloEleitoral(rs.getInt("titulo_eleitoral_eleitor"));
                objCandidatoDTO.setImagem(rs.getBytes("imagem"));
                objCandidatoDTO.setSituacao(rs.getString("situacao").charAt(0));
                
                return objCandidatoDTO;
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
            ps = con.prepareStatement("insert into candidato(titulo_eleitoral_eleitor, numero_candidato, imagem, situacao) values (?, ?, ?, 'P')");
            ps.setInt(1, objCandidato.getTituloEleitoral());
            ps.setInt(2, objCandidato.getNumeroCandidato());
            ps.setBytes(3, objCandidato.getImagem());
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
            String sql = "UPDATE candidato SET ";
            if (objCandidato.getImagem() != null) {
                sql += "imagem = '" + objCandidato.getImagem() + "'";
            }
            if (objCandidato.getSituacao() != null) {
                if (objCandidato.getImagem() != null) {
                    sql += ", ";
                }
                sql += "situacao = '" + objCandidato.getSituacao() + "'";
            }

            ps = con.prepareStatement(sql + " WHERE titulo_eleitoral_eleitor = " + objCandidato.getTituloEleitoral()+ ";");

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
        objCandidatoDTO.setImagem(rs.getBytes("imagem"));
        objCandidatoDTO.setSituacao(rs.getString("situacao").charAt(0));

        return objCandidatoDTO;
    }

}
