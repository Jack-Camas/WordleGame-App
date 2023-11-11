//
//  ViewController+Extensions.swift
//  Wordle
//
//  Created by Jack Camas on 8/19/23.
//

import Foundation
import UIKit

extension ViewController {
  func setupNavigationBar() {
    navigationController!.navigationBar.isTranslucent = false
    navigationController!.navigationBar.titleTextAttributes = [
      .font: UIFont.systemFont(ofSize: 28.0),
      .foregroundColor: UIColor.white
    ]
    navigationController!.navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "bell"),
      style: .plain,
      target: nil,
      action: nil
    )
  }
}
