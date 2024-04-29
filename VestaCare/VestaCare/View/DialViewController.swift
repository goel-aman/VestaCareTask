//
//  DialViewController.swift
//  VestaCare
//
//  Created by aman on 26/04/24.
//

import UIKit

class DialViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textField: UITextField!
    fileprivate let cellId = "cellId"
    
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]
    let letters = ["", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V", "W X Y Z", "", "+", "" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14.0)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)

    }
    
    func updateTextField(withText text: String) {
        textField.text! += text
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateTextField(withText: numbers[indexPath.row])
        return
    }
}

extension DialViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        cell.digitLabels.text = numbers[indexPath.row]
        cell.lettersLabels.text = letters[indexPath.row]
        return cell
    }
}

extension DialViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftRightPadding = view.frame.width * 0.13
        let interSpacing = view.frame.width * 0.1
        let cellWidth = (view.frame.width - 2 * leftRightPadding - 2 * interSpacing) / 3
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightPadding = view.frame.width * 0.13
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
