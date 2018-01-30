//
//  EditAvatarVC.swift
//  smack
//
//  Created by Ильин Роман on 29.01.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit

class EditAvatarVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var avatarType = AvatarType.dark

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "EditAvatarCell", bundle: nil), forCellWithReuseIdentifier: "editAvatarCell")
        
        //collectionView.registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellWithReuseIdentifier:@"MyCell"];
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "editAvatarCell", for: indexPath) as? EditAvatarCell {
            cell.configureCell(index: indexPath.row, type: avatarType)
            return cell
        }
        return EditAvatarCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfColumns: CGFloat = 3
        
        if UIScreen.main.bounds.width > 320 {
            numberOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfColumns - 1) * spaceBetweenCells) / numberOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setEditedAvatarName(name: "dark\(indexPath.item)")
        } else {
            UserDataService.instance.setEditedAvatarName(name: "light\(indexPath.item)")
        }
        NotificationCenter.default.post(name: NOTIF_USER_DATA_EDITED, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentedControlPressed(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        collectionView.reloadData()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
