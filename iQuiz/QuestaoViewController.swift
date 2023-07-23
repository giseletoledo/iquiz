//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by GISELE TOLEDO on 22/07/23.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet var botoesRespostas: [UIButton]!
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        //print(sender.tag)
        let usuarioAcertouResposta = questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertouResposta {
            pontuacao += 1
            print("O usuário acertou!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurarLayout()
        configurarQuestao()
        
    }
    
    func configurarLayout(){
        navigationItem
            .hidesBackButton = true
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = .center
        for botao in botoesRespostas{
            botao.layer.cornerRadius = 12.0
        }
    }
    
    func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        
        for botao in botoesRespostas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
        }
                       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
