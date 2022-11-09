//
//  AutorViewController.swift
//  LearningTask-8.2
//
//  Created by Italo cavalcanti on 08/11/22.
//

import UIKit

class AutorViewController: UITableViewController {
        
    var livrosAPI: LivrosAPI?
    
    var livros: [Livro] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var autor: Autor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        setupViews()
        carregaLivros()
    }
    
    func carregaLivros() {
        guard let livrosAPI = livrosAPI else { return }
        self.livros = livrosAPI.carregaLivros(por: autor)
    }
    
    func setupViews() {
        tableView.tableHeaderView = AutorTableHeaderView.constroi(para: autor)
        
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }

}

// MARK: - UITableViewDataSource implementations
extension AutorViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        livros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LivrosDoAutorViewCell") as? LivrosDoAutorViewCell else {
            fatalError("Não foi possível obter célula para a lista de livros")
        }
        cell.livro = livros[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate implementations
extension AutorViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível obter a seção para a lista de livros")
        }
        header.titulo = "Livros publicados"
        return header
    }
}
