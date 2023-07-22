//
//  ViewController.swift
//  iQuiz
//
//  Created by GISELE TOLEDO on 22/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var botaoIniciarQuiz: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoPressionado(_ sender: Any) {
        print("O botão foi pressionado!")
    }
    
    func configuraLayout(){
        botaoIniciarQuiz.layer
            .cornerRadius = 12.0
    }
    
}

