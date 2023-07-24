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
    var userHasAnswered = false
    
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet var botoesRespostas: [UIButton]!
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        
        if userHasAnswered {
                   return
               }
               
        userHasAnswered = true
        
        let usuarioAcertouResposta = questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertouResposta {
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
            //print("O usuário acertou!")
        } else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        //Código adicionado, além do curso da Alura de iOS
        
        // Update progress bar's value based on the number of questions answered.
            let progressValue = Float(numeroQuestao + 1) / Float(questoes.count)
            progressBar.setProgress(progressValue, animated: true)
        
        // Desabilitar os botões depois de selecionar uma alternativa
               for botao in botoesRespostas {
                   botao.isUserInteractionEnabled = false
               }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            navegaParaTelaDesempenho()
        }
    }
    
    func navegaParaTelaDesempenho(){
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurarLayout()
        configurarQuestao()
        
        progressBar.progress = 0.0
        
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
    
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        
           let imageName = questoes[numeroQuestao].imagemNome
           if let image = UIImage(named: imageName) {
               imageQuestion.image = image
           } else {
               imageQuestion.image = UIImage(named: "Logo")
           }
        
        for botao in botoesRespostas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
            botao.isUserInteractionEnabled = true
        }
        userHasAnswered = false
                       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else {
            return
        }
        desempenhoVC.pontuacao = pontuacao
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
