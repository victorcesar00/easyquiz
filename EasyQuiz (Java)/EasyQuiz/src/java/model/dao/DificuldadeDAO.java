/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.domain.Dificuldade;
import model.exception.ExcecaoPersistencia;

/**
 *
 * @author Aluno
 */
public interface DificuldadeDAO {
    public Dificuldade getDificuldadeById(Long cod_Dificuldade) throws ExcecaoPersistencia;
    public List<Dificuldade> listAll() throws ExcecaoPersistencia;
}
