//
//  ViewController.swift
//  EverisFilmes
//
//  Created by Breno Luizetto Cintra on 07/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FilmeAPI().recuperaFilmes()
        
    }
    
//   
    
    }



