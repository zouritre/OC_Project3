//
//  GameSession.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

struct GameSession{
    var players: [Player] = []
    var isFinished: Bool = false
    var actualRound: Int = 1
    var winner: String?
    var chestAvailable: Bool = false
    var character_sTurnToPlay: Character = Character()
}
