//
//  BoardController.swift
//  Wordle
//
//  Created by Jack Camas on 8/19/23.
//

import Foundation
import UIKit

class BoardController: NSObject,
                       UICollectionViewDataSource,
                       UICollectionViewDelegate,
                       UICollectionViewDelegateFlowLayout {

  // MARK: - Properties
  let numItemsPerRow = 5
  let numRows = 6
  let collectionView: UICollectionView
  let goalWord: [String]

  var numTimesGuessed = 0
  var currRow: Int {
    return numTimesGuessed / numItemsPerRow
  }

  init(collectionView: UICollectionView) {
    self.collectionView = collectionView
	let theme = WordTheme(rawValue: "animals")!
    self.goalWord = WordGenerator.generateRandomWord(with: theme)
    super.init()
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  // MARK: - Public Methods
	
	func resetBoardWithCurrentSettings() {
		numTimesGuessed = 0
		collectionView.reloadData()
	}
	
  func enter(_ string: String) {
    guard numTimesGuessed < numItemsPerRow * numRows else { return }
    let cell = collectionView.cellForItem(at: IndexPath(item: numTimesGuessed, section: 0)) as! LetterCell
    cell.set(letter: string)
    UIView.animate(withDuration: 0.1,
                   delay: 0.0,
                   options: [.autoreverse],
                   animations: {
		
		cell.transform = cell.transform.scaledBy(x: 1.05, y: 1.05)
    }, completion: { finished in
      cell.transform = CGAffineTransformIdentity
    })
    if isFinalGuessInRow() {
      markLettersInRow()
    }
    numTimesGuessed += 1
  }

  func deleteLastCharacter() {
    guard numTimesGuessed > 0 && numTimesGuessed % numItemsPerRow != 0 else { return }
    let cell = collectionView.cellForItem(at: IndexPath(item: numTimesGuessed - 1, section: 0)) as! LetterCell
    numTimesGuessed -= 1
	  cell.clearLetter()
	  cell.set(style: .initial)
  }
}
