//
//  Questao.swift
//  iQuiz
//
//  Created by GISELE TOLEDO on 22/07/23.
//

import Foundation

struct Questao {
    var titulo: String
    var imagemNome: String
    var respostas: [String]
    var respostaCorreta: Int
}

let questoes: [Questao] = [
    Questao(titulo: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",imagemNome: "harrypotter", respostas: ["Expecto Patronum", "Avada Kedavra", "Expelliarmus"], respostaCorreta: 2),
    Questao(titulo: "Quando foi lançado o filme Avatar 2?", imagemNome: "avatar2", respostas: ["2014", "2022", "2023"], respostaCorreta: 1),
    Questao(titulo: "Quando foi lançado o filme Vingadores Ultimato?", imagemNome: "vingadores3", respostas: ["2019", "2018", "2017"], respostaCorreta: 0),
    Questao(titulo: "Qual é o primeiro filme da franquia Star Wars?", imagemNome: "starwars", respostas: ["Star Wars: A Ameaça Fantasma", "Star Wars: Uma Nova Esperança", "Star Wars: O Império Contra-Ataca"], respostaCorreta: 1),

]
