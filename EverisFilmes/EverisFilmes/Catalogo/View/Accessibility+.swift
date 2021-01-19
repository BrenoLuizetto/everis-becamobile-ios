//
//  Accessibility+.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 19/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

extension DetalhesFilmesViewController {
    // MARK: - Accessibility
    func avaliacaoAccessibility(_ avaliacao: Double) {
        labelEstrela.isAccessibilityElement = true
        labelEstrela.accessibilityLabel = ""
        if avaliacao >= 85 {
            labelEstrela.accessibilityValue = "cinco estrelas"
        } else if avaliacao >= 65 && avaliacao < 85 {
            labelEstrela.accessibilityValue = "quatro estrelas"
        } else if avaliacao >= 50 && avaliacao < 65 {
            labelEstrela.accessibilityValue = "três estrelas"
        } else if avaliacao >= 30 && avaliacao < 50 {
            labelEstrela.accessibilityValue = "duas estrelas"
        } else {
            labelEstrela.accessibilityValue = "uma estrela"
        }
    }
    func porcentagemAcessibility(_ indice: Double) {
        labelRating.isAccessibilityElement = true
        labelRating.accessibilityLabel = "Indice de aprovação"
        labelRating.accessibilityValue = "\(indice) %"
    }
    func configuraLabel() {
        labelTitulo.font = .preferredFont(forTextStyle: .body)
        labelTitulo.adjustsFontForContentSizeCategory = true
        labelEstrela.font = .preferredFont(forTextStyle: .body)
        labelEstrela.adjustsFontForContentSizeCategory = true
        labelDescricao.font = .preferredFont(forTextStyle: .body)
        labelDescricao.adjustsFontForContentSizeCategory = true
        tituloAvaliacao.font = .preferredFont(forTextStyle: .body)
        tituloAvaliacao.adjustsFontForContentSizeCategory = true
        tituloSinopse.font = .preferredFont(forTextStyle: .body)
        tituloSinopse.adjustsFontForContentSizeCategory = true
        labelRating.font = .preferredFont(forTextStyle: .body)
        labelRating.adjustsFontForContentSizeCategory = true
    }

}
