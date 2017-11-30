//
//  SmallAppListHolderCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents
import Alamofire


class SmallListHolderCell: DatasourceCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    var appSelectedDelegate: OnAppSelectedDelegate? = nil
    
    var searchTerm : String?{
        didSet{
            
            
            
            var apps: [App] = [App]()
            
            let app1 = App(appName: "Injustice", appDesc: "When iconic superheroes collide", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "camera_app", screenShots: [""])
            
            let app2 = App(appName: "Cubic Cosmos", appDesc: "When geometry arrives space", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "camera_app", screenShots: [""])
            
            let app3 = App(appName: "Monument Valley", appDesc: "Inside the iconic sequel", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "camera_app", screenShots: [""])
            apps = [app1, app2, app3]
            self.apps = apps
            
            self.collectionView.reloadData()

//            if let s = searchTerm{
//                Service.sharedInstance.getAppSearch(searchTerm: s, completed: {data in
//                    self.apps = data
//                    self.collectionView.reloadData()
//                })
//            }
        }
    }
    
    var collectionView : UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    
    var apps = [App]()
    
    override func setupViews() {
        addSubview(collectionView)
        
        self.backgroundColor = .white
        
        collectionView.fillSuperview()
        
        //        divider.anchor(nil, left: collectionView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        collectionView.register(SmallAppCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:
        IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? SmallAppCell
        {
            cell.app = apps[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let app = apps[indexPath.row]
        appSelectedDelegate?.setSelectedApp(app: app)
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 32, height: 85)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    
}
