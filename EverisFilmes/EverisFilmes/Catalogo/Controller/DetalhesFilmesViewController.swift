//
//  DetalhesFilmesViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 10/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class DetalhesFilmesViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var imagemDetalhes: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var avaliacaoView: UIView!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!

    // MARK: - Variaveis

    var listaDeFilmes: Result?

    // MARK: - life Cycle

    override func viewWillAppear(_ animated: Bool) {

        avaliacaoView.layer.borderWidth=1.0
        avaliacaoView.layer.masksToBounds = false
        avaliacaoView.layer.cornerRadius = avaliacaoView.frame.size.height/2
        avaliacaoView.clipsToBounds = true

        configuraFilme()

    }

    // MARK: - Métodos

    func configuraFilme() {
        if let filme = listaDeFilmes {

            labelTitulo.text = FilmesViewController().configuraTitulo(filme.originalTitle, filme.originalName, filme.mediaType)

            if let descricaoFilme = filme.overview {
                self.labelDescricao.text = descricaoFilme
            }

            let caminhoDaImagem: String
            caminhoDaImagem = filme.backdropPath

            let imageUrl = URL(string: "https://image.tmdb.org/t/p/original\(caminhoDaImagem)")

            if let url = imageUrl {
                imagemDetalhes.af_setImage(withURL: url)
            }

            var avaliacao = filme.voteAverage
            avaliacao *= 10
            estrelasFilme(avaliacao: avaliacao)

            let classificaoFilme = String(format: "%.0f%%", avaliacao)
            self.labelRating.text = classificaoFilme

        }

    }

    func estrelasFilme(avaliacao: Double) {
        if avaliacao >= 80 {
            self.labelEstrela.text = "⭐⭐⭐⭐⭐"
        } else if avaliacao >= 65 && avaliacao < 80 {
            self.labelEstrela.text = "⭐⭐⭐⭐"
        } else if avaliacao >= 50 && avaliacao < 65 {
            self.labelEstrela.text = "⭐⭐⭐"
        } else if avaliacao >= 35 && avaliacao < 50 {
            self.labelEstrela.text = "⭐⭐"
        } else {
            self.labelEstrela.text = "⭐"
        }
    }

}
