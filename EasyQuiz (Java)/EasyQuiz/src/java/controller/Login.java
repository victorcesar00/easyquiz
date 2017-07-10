/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.daoimpl.SessaoDAOImpl;
import model.daoimpl.UsuarioDAOImpl;
import model.domain.Sessao;
import model.domain.Usuario;
import model.exception.ExcecaoNegocio;
import model.exception.ExcecaoPersistencia;
import model.service.ManterSessao;
import model.service.ManterUsuario;
import model.serviceimpl.ManterSessaoImpl;
import model.serviceimpl.ManterUsuarioImpl;

/**
 *
 * @author andro
 */
public class Login {
    @SuppressWarnings("static-access")
    public static String execute(HttpServletRequest request) {

        String jsp = "";

        try {
            //String email = request.getParameter("email");
            //String senha = request.getParameter("senha");
            String email = "andromenus@gmail.com";
            String senha = "123";

            ManterUsuario manterUsuario = new ManterUsuarioImpl(UsuarioDAOImpl.getInstance());
            Usuario usuario = manterUsuario.getUsuarioByEmailSenha(email, senha);
            System.out.println("Usuario: "+usuario.getNom_Usuario());

            if (usuario == null) {
                String erro = "Usuario nao encontrado!";
                request.setAttribute("erro", erro);
                jsp = "/erro.jsp";
            } else {
                request.getSession().setAttribute("cod_Usuario", usuario.getCod_Usuario());
                request.getSession().setAttribute("dat_Inicio", Instant.now());
                ManterSessao manterSessao = 
                        new ManterSessaoImpl(SessaoDAOImpl.getInstance());
                Sessao sessao = new Sessao();
                sessao.setUsuario(usuario);
                sessao.setDat_Inicio((Instant)request.getSession().getAttribute("dat_Inicio"));
                manterSessao.cadastrarSessao(sessao);
                jsp = "/TelaQuestoes.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
            jsp = "";
        }
        return jsp;
    }

    public static int validarSessao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long cod_Usuario = (Long) request.getSession().getAttribute("cod_Usuario");
        String jsp = "";
        if (cod_Usuario == null) {
            return 0;
        } else {
            return 1;
        }
    }
}
