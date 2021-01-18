//
//  ViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on var01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import AlamofireImage

class FilmesViewController: UITableViewController, RespostaAPI {
    func success(modelo: ModeloFilme) {
        listaDeFilmes = modelo
        tableView.reloadData()
    }
    
    func failure() {
        print("deu ruim")
    }
    
    //MARK: Variaveis
    
    var listaDeFilmes: ModeloFilme?
    
    var api =  FilmeAPI()
    
    var valor: Int!
    var  paginaAtual = 1
    
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        api.configura(delegate: self)
        api.recuperaFilmes(pagina: paginaAtual)
        
    }
    
    
    //MARK: - Métodos
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaDeFilmes?.results.count ?? 0
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmeTableViewCell
           guard let filme = listaDeFilmes?.results[indexPath.row] else {return celula}
       
           let titulo = configuraTitulo(filme.originalTitle, filme.originalName, filme.mediaType)
           celula.labelTitulo.text = titulo
       
           guard let poster = filme.posterPath else {return celula }
           if let url = URL(string: configuraPoster(poster)) {
               celula.imagemFilme?.af_setImage(withURL: url)
           }
           
           return celula
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmes = listaDeFilmes?.results[indexPath.row]
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesFilmes") as! DetalhesFilmesViewController
        
        controller.listaDeFilmes = filmes
        self.navigationController?.pushViewController(controller,animated: true)
    }
    
    func configuraTitulo(_ tituloOriginal: String?, _ nomeOriginal: String?, _ tipoFilme: String?) -> String{
        let titulo: String
        if tipoFilme == "movie" {
            titulo = tituloOriginal ?? ""
            return titulo
        }else{
            titulo = nomeOriginal ?? ""
            return titulo
        }
    }
    func configuraPoster(_ caminhoDaImagem: String) -> String{
        let imagemUrl = String("https://image.tmdb.org/t/p/original\(caminhoDaImagem)")
            return imagemUrl
    }
    
   
    //MARK: - IBOutlet
    
    @IBAction func buttonVerMais(_ sender: UIButton) {
        paginaAtual = paginaAtual + 1
        viewDidLoad()
        tableView.reloadData()
    }
    
    @IBAction func paginaAnterior(_ sender: Any) {
        
        if paginaAtual >= 2 {
        paginaAtual = paginaAtual - 1
        viewDidLoad()
        tableView.reloadData()
        }
    }
        
    
    
    
   
    
    
}
