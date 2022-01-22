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
        
        func createButton(name: String) -> UIButton{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(name, for: .normal)
            button.backgroundColor = UIColor.random
            
            return button
        }
        
        func createTextView() -> UITextView {
            let textView = UITextView()
            textView.isScrollEnabled = false
            
            return textView
        }
        
        func createStackView() -> UIStackView{
            let stackView = UIStackView()
            stackView.axis = NSLayoutConstraint.Axis.horizontal
            stackView.alignment = UIStackView.Alignment.fill
            stackView.distribution = UIStackView.Distribution.fillEqually
            stackView.spacing = 2
            
            return stackView
        }
//        Create as much buttons as there are playable characters in the game
//        And set their default names on the buttons
        for character in CharacterList.characterList{
            let rowPlayer1 = createStackView()
            rowPlayer1.addArrangedSubview(createButton(name: character.name))
            rowPlayer1.addArrangedSubview(createTextView())
            
            let rowPlayer2 = createStackView()
            rowPlayer2.addArrangedSubview(createButton(name: character.name))
            rowPlayer2.addArrangedSubview(createTextView())
            player1CharacterList.addArrangedSubview(rowPlayer1)
            player2CharacterList.addArrangedSubview(rowPlayer2)
            

        }
        
    }
}
