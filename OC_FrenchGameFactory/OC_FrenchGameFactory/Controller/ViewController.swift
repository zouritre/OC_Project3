//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var player1CharacterList: UIStackView!
    @IBOutlet weak var player2CharacterList: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Populate the empty character list for each players when the app starts
        CharacterList.displayAvailableCharacters(in: player1CharacterList)
        CharacterList.displayAvailableCharacters(in: player2CharacterList)
        
    }
}
