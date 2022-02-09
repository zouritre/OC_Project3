//
//  CharactersActionsPopoverVC.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 02/02/2022.
//

import UIKit

class CharactersActionsPopoverVC: UIViewController {
    
    
    
    
    // MARK: - IBOutlets
    
    
    
    
    @IBOutlet weak var actionDetail: ActionDetailStackView!
    
//    Linked to "Heal" and "Attack" buttons. Create a button for each character of ally team if "Heal" is pressed or each character in ennemy team if "Attack" is pressed
    @IBAction func actionToPerfom(_ sender: UIButton) {
        
        
//        Set previously selected button to default blue
        previousSender.backgroundColor = .systemBlue
        previousSender = sender
        
        sender.backgroundColor = .orange
        
        
        
        switch sender.currentTitle {
        
            
            
        case "Heal": populateCharacterListForActions(action: "Heal")
            
        case "Attack": populateCharacterListForActions(action: "Attack")
            
        default: return
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Variables
    
    
    
    
//    Used to display the character list in ActionDetail StackView according to the action selected: Heal or Attack
    internal var alliesAndFoes: [String:Player] = [:]
    
    private var previousSender : UIButton = UIButton()
    
    
    
    
    
    
    
    
    
    // MARK: - Populate List for "Heal" Button and "Attack" Button
    
    
    
    
    private func populateCharacterListForActions(action: String) {
        
        
//      Remove all existing subviews (buttons) in the ActionDetail StackView to avoid infinite stacking
        actionDetail.subviews.forEach({ $0.removeFromSuperview() });
        
//      Tell the stackView wich player is on the side of the selected character (the one who is performing the  action) and wich is not to create their corresponding         buttons in the StackView
        actionDetail.alliesAndFoes = alliesAndFoes
        
//      Populate the StackView with new buttons
        actionDetail.displayAvailableTargetCharacters(action: action);
        
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - View Did Load
    



    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
    }
    

}
