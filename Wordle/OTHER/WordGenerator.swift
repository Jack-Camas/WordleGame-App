//
//  WordGenerator.swift
//  Wordle
//
//  Created by Jack Camas on 8/19/23.
//

import Foundation

class WordGenerator {
	
	static let possibleWords = ["ABCDE", "HOUSE", "ANIME", "MINUS", "SOLVE", "GAMES"]
  static func generateRandomWord() -> String? {
	  guard let random = possibleWords.randomElement() else { return nil }
	  print("Random Word: \(random)")
	  return random
  }
}

