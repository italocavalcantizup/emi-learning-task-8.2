//
//  NovoAutorViewController.swift
//  LearningTask-8.2
//
//  Created by rafael.rollo on 20/06/2022.
//

import UIKit

class NovoAutorViewController: UIViewController {

    typealias MensagemDeValidacao = String
    
    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoSalvarPressionado(_ sender: UIButton) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            cadastraAutor()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let fotoUrl = fotoTextField.text, fotoUrl.isEmpty {
            return (false, "Informe a URL da foto do autor")
        }
        
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false, "Nome não pode estar em branco")
        }
        
        if let bio = bioTextField.text, bio.isEmpty {
            return (false, "A bio do autor não pode estar em branco")
        }
        
        if let tecnologias = tecnologiasTextField.text, tecnologias.isEmpty {
            return (false, "Informe as tecnologias sobre as quais o autor escreve")
        }
        
        return (true, nil)
    }
    
    func exibeAlerta(titulo: String?, mensagem: String?) {
        let alert = UIAlertController(
            title: titulo,
            message: mensagem,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func cadastraAutor() {
        // código que coordena o cadastro efetivamente
        exibeAlerta(titulo: "Feito", mensagem: "Autor cadastrado com sucesso")
    }

}

