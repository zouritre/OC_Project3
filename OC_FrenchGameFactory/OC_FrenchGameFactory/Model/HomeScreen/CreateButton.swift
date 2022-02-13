//
//  CreateButton.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 23/01/2022.
//

import Foundation
import UIKit


class CreateButton: UIButton{
    
    
    /// Character corresponding to this button instance
    var correspondingCharacter: Character?
    
    /// Used to display or hide the textView corresponding to this button instance when it is pressed
    var customNameTextView: UITextView?
    
    // Used to reverse to button visual state when it is selected or unselected
    var pressed : Bool = false
    
    
    
    override init(frame: CGRect) {
        
        
        
        super.init(frame: frame)
    
    
    
    }

    
    
    required init?(coder aDecoder: NSCoder) {
    
        
        
        super.init(coder: aDecoder)
    
    
    
    }



}
