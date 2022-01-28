//
//  CreateButton.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 23/01/2022.
//

import Foundation
import UIKit

//Create a random color when called on a UIColor object
extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...0.5),
            green: .random(in: 0...0.5),
            blue: .random(in: 0...0.5),
            alpha: 1.0
        )
    }
}

class CreateButton: UIButton{
    var correspondingCharacter: Character?
    var correspondingCustomName: UITextView? // Used to display or hide the textView if button is pressed
    var pressed : Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
