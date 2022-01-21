//
//  ViewController.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 16/01/2022.
//

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

class ViewController: UIViewController {
    @IBOutlet weak var player1CharacterList: UIStackView!
    @IBOutlet weak var player2CharacterList: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Create as much buttons as there are playable characters in the game
//        And set their default names on the buttons
        for character in CharacterList.characterList{
            let stackView = UIStackView()
            stackView.axis = NSLayoutConstraint.Axis.horizontal
            stackView.alignment = UIStackView.Alignment.fill
            stackView.distribution = UIStackView.Distribution.fillEqually
            stackView.spacing = 2
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(character.name, for: .normal)
            button.backgroundColor = UIColor.random
            stackView.addArrangedSubview(button)
            
            let textView = UITextView()
            textView.isScrollEnabled = false
            stackView.addArrangedSubview(textView)
            
            player1CharacterList.addArrangedSubview(stackView)
            

            let button1 = UIButton()
            button1.translatesAutoresizingMaskIntoConstraints = false
            button1.setTitle(character.name, for: .normal)
            button1.backgroundColor = UIColor.random
            player2CharacterList.addArrangedSubview(button1)
            
//            let textView1 = UITextView()
//            textView1.translatesAutoresizingMaskIntoConstraints = false
//            player1CustomNames.addArrangedSubview(textView1)
        }
        
    }
}
