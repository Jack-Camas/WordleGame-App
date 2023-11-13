//
//  WordGenerator.swift
//  Wordle
//
//  Created by Jack Camas on 8/19/23.
//

import Foundation

enum WordTheme: String {
	case normal, animals, countries
	
	func possibleWords() -> [String] {
		switch self {
		case .normal:
			return normalWords()
		case .animals:
			return animalWords()
		case .countries:
			return countryWords()
		}
	}
	
	private func normalWords() -> [String] {
		return ["SEED", "GOAT", "LOAD"]
	}
	
	private func animalWords() -> [String] {
		return ["SEAL", "DEER", "FROG"]
	}
	
	private func countryWords() -> [String] {
		return ["PERU", "CUBA", "MALI"]
	}
}

class WordGenerator {
	
	static func generateRandomWord(with theme: WordTheme) -> [String] {
		let randomWord = theme.possibleWords().randomElement()!
		print("Random Word: \(randomWord)")
		return randomWord.map { String($0) }
	}
}

