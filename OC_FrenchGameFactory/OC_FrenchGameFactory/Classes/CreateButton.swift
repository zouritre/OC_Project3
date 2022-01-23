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
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func customButton(for character: Character) -> UIButton{
        let button = CreateButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(character.originalName, for: .normal)
        button.corespondingCharacter = character
        button.backgroundColor = UIColor.random
        button.addTarget(self, action: #selector(self.pressed(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func pressed(_ sender: CreateButton) {
        print(sender.corespondingCharacter!.originalName)
    }
}
