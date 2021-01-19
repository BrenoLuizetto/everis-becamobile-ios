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
    @IBOutlet weak var tituloAvaliacao: UILabel!
    @IBOutlet weak var tituloSinopse: UILabel!
    @IBOutlet weak var constraintLargura: NSLayoutConstraint!
    // MARK: - Variaveis

    var listaDeFilmes: Result?

    // MARK: - life Cycle

    override func viewWillAppear(_ animated: Bool) {

        labelRating.layer.borderWidth=1.0
        labelRating.layer.masksToBounds = false
        labelRating.layer.cornerRadius = labelRating.frame.size.height/2
        labelRating.clipsToBounds = true

        configuraFilme()
        configuraLabel()

    }
    // MARK: - Métodos
//    func setupController() {
//        constraintLargura.constant = 100
//        labelRating.sizeToFit()
//        var frameLabel = labelRating.frame.width
//    }

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
            avaliacaoAccessibility(avaliacao)
            porcentagemAcessibility(avaliacao)

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
