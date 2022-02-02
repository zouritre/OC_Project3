//
//  CharactersActionsPopoverVC.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 02/02/2022.
//

import UIKit

class CharactersActionsPopoverVC: UIViewController {
    
    
    
    
    // MARK: - IBOutlets
    
    
    
    
    @IBOutlet weak var actionDetail: ActionDetail!
    
    @IBAction func actionToPerfom(_ sender: UIButton) {
        
        sender.backgroundColor = .orange
        switch sender.currentTitle {
            
        case "Heal":
            actionDetail.subviews.forEach({ $0.removeFromSuperview() });
            actionDetail.displayAvailableTargetCharacters(action: "Heal");
            actionDetail.alliesAndFoes = alliesAndFoes
        case "Attack":
            actionDetail.subviews.forEach({ $0.removeFromSuperview() });
            actionDetail.displayAvailableTargetCharacters(action: "Attack");
            actionDetail.alliesAndFoes = alliesAndFoes
        default: return
            
        }
    }
    
    
    var alliesAndFoes: [String:Player] = [:]
    



    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("Action screen: \(alliesAndFoes)")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
