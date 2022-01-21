//
//  GameSession.swift
//  OC_FrenchGameFactory
//
//  Created by Bertrand Dalleau on 21/01/2022.
//

import Foundation

class GameSession{
    var players: [Player]
    var isFinished: Bool
    var actualRound: Int
    var winner: String?
    init(){
        players = []
        isFinished = false
        actualRound = 0
    }
}
