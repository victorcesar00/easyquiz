/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.daoimpl.QuestaoDAOImpl;
import model.daoimpl.QuestaoFechadaDAOImpl;
import model.domain.Questao;
import model.domain.QuestaoFechada;
import model.service.ManterQuestao;
import model.service.ManterQuestaoFechada;
import model.serviceimpl.ManterQuestaoFechadaImpl;
import model.serviceimpl.ManterQuestaoImpl;
/**
 *
 * @author Luiz
 */
class EditarQuestao {
    public static String execute(HttpServletRequest request) {
        String jsp = "";
        try {
            ManterQuestao manterQuestao = new ManterQuestaoImpl(QuestaoDAOImpl.getInstance());
            Long idDaQuestao = Long.parseLong(request.getParameter("idquestao"));
            int ordem = Integer.parseInt(request.getParameter("ordem"));
            Questao questaoAlterada = manterQuestao.getQuestaoById(idDaQuestao);
            String novoEnunciado = request.getParameter("txtAreaEnun0");
            questaoAlterada.setTxtEnunciado(novoEnunciado);
            manterQuestao.alterarQuestao(questaoAlterada);
            if (questaoAlterada.getIdTipo()=='A'){
                String novaResposta = request.getParameter("resposta-correta"+ordem);
                questaoAlterada.setTxtResposta(novaResposta);
                manterQuestao.alterarQuestao(questaoAlterada);
            } else if (questaoAlterada.getIdTipo()=='F'){
                ManterQuestaoFechada manterQuestaoFechada = new ManterQuestaoFechadaImpl(QuestaoFechadaDAOImpl.getInstance());
                int qtdAlternativas = manterQuestaoFechada.getAll(idDaQuestao).size();
                List<QuestaoFechada> novasAlternativas = new ArrayList();
                for (int i=0; i<qtdAlternativas; i++){
                    QuestaoFechada qf = new QuestaoFechada();
                    qf.setQuestao(questaoAlterada);
                    String txtAlternativa = request.getParameter("txtArea"+ordem+"-"+i);
                    qf.setTxtAlternativa(txtAlternativa);
                    qf.setSeqAlternativa(new Long(i));
                    novasAlternativas.add(qf);
                }
                manterQuestaoFechada.deletarQuestaoFechada(idDaQuestao);
                manterQuestaoFechada.cadastrarQuestaoFechada(novasAlternativas);
                
            }
            jsp = "EditarQuestao.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            jsp = "";
        }
        return jsp;
    }
}
