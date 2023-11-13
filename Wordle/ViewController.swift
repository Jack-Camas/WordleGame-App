//
//  ViewController.swift
//  Wordle
//
//  Created by Jack Camas on 8/19/23.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var wordsCollectionView: UICollectionView!
  @IBOutlet weak var keyboardCollectionView: UICollectionView!

  private var boardController: BoardController!
  private var keyboardController: KeyboardController!

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationBar()

    boardController = BoardController(collectionView: wordsCollectionView)
    keyboardController = KeyboardController(collectionView: keyboardCollectionView)
	  
	  keyboardController.didSelectString = { string in
		  if string == DELETE_KEY {
			  self.boardController.deleteLastCharacter()
		  } else {
			  self.boardController.enter(string)
		  }
	  }
	  let rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(didTapSettingsButton))
	  rightBarButtonItem.tintColor = .white
	  navigationItem.rightBarButtonItem = rightBarButtonItem
	  
	  let leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(didTapResetButton))
	  leftBarButtonItem.tintColor = .white
	  navigationItem.leftBarButtonItem = leftBarButtonItem
	  
  }
	
	@objc private func didTapSettingsButton() {
		
	}
	
	@objc private func didTapResetButton() {
		
	}
}
