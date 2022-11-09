//
//  AutorTableViewCell.swift
//  LearningTask-8.2
//
//  Created by rafael.rollo on 20/06/2022.
//

import UIKit

class AutorTableViewCell: UITableViewCell {

    @IBOutlet private weak var nomeLabel: UILabel!
    @IBOutlet private weak var tecnologiasLabel: UILabel!

    var autor: Autor? {
        didSet {
            guard let autor = autor else { return }

            nomeLabel.text = autor.nomeCompleto
            tecnologiasLabel.text = autor.tecnologias.joined(separator: ", ")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .texasRose.withAlphaComponent(0.3)
        selectedBackgroundView = bgColorView
    }
    
}

