//
//  LivrosTableViewCell.swift
//  LearningTask-8.2
//
//  Created by Italo cavalcanti on 08/11/22.
//

import UIKit

class LivrosDoAutorViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var livroCapaImageView: UIImageView!
    
    var livro: Livro? {
        didSet {
            guard let livro = livro else { return }
            titleLabel.text = livro.titulo
            livroCapaImageView.image = UIImage.init(livro.imagemDeCapaURI, aspectFillIn: livroCapaImageView.frame)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .texasRose.withAlphaComponent(0.3)
        selectedBackgroundView = bgColorView
    }
}
