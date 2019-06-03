//
//  ViewController.swift
//  TestFirstInterview
//
//  Created by Guerson on 5/30/19.
//  Copyright © 2019 ItandehuiP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fillOrEditButton: UIButton!
    
    
    
    var isSaved : Bool = false
    let dataForCollection = ModelForCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isSaved {
            detailLabel.text = "Información agregada"
            collectionView.isHidden = false
            dataForCollection.setToUserSigned()
            collectionView.reloadData()
            fillOrEditButton.titleLabel?.text = "Editar"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FillViewControllerSegue" {
            guard let fillController = segue.destination as? FillViewController else { return }
            fillController.delegate = self
            if isSaved {
            fillController.editingInf = true
            }
        }
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataForCollection.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return dataForCollection.countCellsForSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserInfoCell", for: indexPath) as? ModelCollectionViewCell else {
            return UICollectionViewCell()
        }
        let userInfo = dataForCollection.cellForIndexPath(indexPath: indexPath)
        cell.titleLabel.text =  userInfo.title
        cell.valueLabel.text = userInfo.value
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderIdentifier", for: indexPath) as? SectionHeaderCollectionReusableView else { fatalError("Invalid View Type") }
            headerView.sectionTitleLabel.text = dataForCollection.sectionForIndexPath(indexPath: indexPath)
            return headerView
            
        default:
            assert(false, "Invalid view type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width - 16
        let height = CGFloat(70)
        return CGSize(width: width, height: height)
        
    }
}

extension ViewController: FillViewControllerDelegate {
    func fillViewControllerDelegateSaveUserInf(saved: Bool) {
        self.isSaved = saved
    }

}
