//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var player2CharacterList: CharacterList!
    @IBOutlet weak var player1CharacterList: CharacterList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Populate the empty character list for each players when the app starts
            player1CharacterList.displayAvailableCharacters(for: Characters())
            player2CharacterList.displayAvailableCharacters(for: Characters())
        
    }
}
