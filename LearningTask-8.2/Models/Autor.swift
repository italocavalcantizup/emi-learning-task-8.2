//
//  Autor.swift
//  LearningTask-8.2
//
//  Created by rafael.rollo on 20/06/2022.
//

import Foundation

struct Autor {
    let fotoURI: String
    let nome: String
    let sobrenome: String
    let bio: String
    let tecnologias: [String]
    
    var nomeCompleto: String {
        return "\(nome) \(sobrenome)"
    }
    
    init(foto: String, nome: String, sobrenome: String, bio: String, tecnologias: String...) {
        fotoURI = foto
        self.nome = nome
        self.sobrenome = sobrenome
        self.bio = bio
        self.tecnologias = tecnologias
    }
}
