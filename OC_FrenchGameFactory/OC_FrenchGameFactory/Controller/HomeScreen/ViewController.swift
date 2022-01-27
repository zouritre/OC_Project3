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
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)}
    
    func avoidButtonsFreeze(){    // When editing textview and trying to interact with other buttons
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not to interfere and cancel other interactions.
            tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avoidButtonsFreeze()
        
//        Populate the empty character list for each players when the app starts
        player1CharacterList.displayAvailableCharacters(for: CharactersList())
        player2CharacterList.displayAvailableCharacters(for: CharactersList())

    }
}
