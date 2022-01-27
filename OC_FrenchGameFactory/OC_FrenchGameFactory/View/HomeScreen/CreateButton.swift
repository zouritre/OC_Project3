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
    var corespondingCharacter: Character?
    var correspondingCustomName: UITextView?
    var pressed : Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
// Create a customized button
    func customButton(for character: Character, customName: UITextView) -> UIButton{
        let button = CreateButton()
        button.corespondingCharacter = character
        button.correspondingCustomName = customName
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(character.originalName, for: .normal)
        button.backgroundColor = UIColor.green
        button.setTitleColor(.darkText, for: .normal)
        button.addTarget(self, action: #selector(self.pressed(_:)), for: .touchUpInside)
        
        return button
    }
    
//    Set button backgorund color to grey if pressed or green if not pressed - Default: Green
    @objc func pressed(_ sender: CreateButton) {
        print(sender.corespondingCharacter!.originalName)
        if  let pressed = sender.pressed{
            sender.pressed = !sender.pressed!
            if pressed{ //  if button is pressed while being grey
                sender.backgroundColor = .green
                sender.correspondingCustomName?.isHidden = true
                sender.correspondingCustomName?.text = "" //    Reset the text if button is unselected
            }
            else{   //  if button is pressed while being green
                sender.backgroundColor = .gray
                sender.correspondingCustomName?.isHidden = false
            }
        }
        else{
            sender.pressed = true
            sender.backgroundColor = .gray
            sender.correspondingCustomName?.isHidden = false
        }
    }
}
