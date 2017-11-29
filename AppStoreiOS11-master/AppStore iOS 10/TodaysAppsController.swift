//
//  TodaysAppsController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import LBTAComponents
import Alamofire

class TodaysAppsController: DatasourceController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast

        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.sectionHeadersPinToVisibleBounds = false
            layout.minimumInteritemSpacing = 1
            layout.minimumLineSpacing = 10
        }
        
        let todayDataSource = TodayAppsDataSource()
        self.datasource = todayDataSource
        
       
    }
    
    
    func setSelectedApp(app: App?) {
//        let app1 = App(appName: "Brand Solutions", appDesc: "One Video Platform to Rule Them All", appID: 1, appCategory: "Leisure", appPrice: 0, appStory:"123", appPhoto: "stream_rail_icon", screenShots: [""])
//        let appDetailVC = AppDetailViewController()
//        appDetailVC.app = app1
//        self.show(appDetailVC, sender: appDetailVC)
        
//        let app1 = App(appName: "Brand Solutions", appDesc: "One Video Platform to Rule Them All", appID: 1, appCategory: "Leisure", appPrice: 0, appStory:"123", appPhoto: "stream_rail_icon", screenShots: [""])
        let deptDetailVC = DepartmentViewController()
        
        deptDetailVC.departmentData = DataManager.sharedInstance.getDepartment(name: "brandSolutions")
        
        let items = ["angry","war", "clan"]
        var apps: [App] = [App]()
        
        let app1 = App(appName: "Injustice", appDesc: "When iconic superheroes collide", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "batmandem", screenShots: [""])
        
        let app2 = App(appName: "Cubic Cosmos", appDesc: "When geometry arrives space", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "cubic_cosmos", screenShots: [""])
        
        let app3 = App(appName: "Monument Valley", appDesc: "Inside the iconic sequel", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "mirage", screenShots: [""])
        apps = [app1, app2, app3]
        let headerItemGames = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Games", hideDiv: false)
        
        var configGames = ViewControllerConfigurator()
        configGames.appsArray = apps
        configGames.listArray = items
        configGames.headerItem = headerItemGames
        configGames.subHeaderTitle = "New Games we love"
        deptDetailVC.config = configGames
        
        self.show(deptDetailVC, sender: deptDetailVC)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setSelectedApp(app: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 95)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 436)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCardCell.self), for: indexPath)
        
        if let data = datasource?.item(indexPath) as? TodayArticle{
            if data.hasApp! && data.withBottomApp!{
                if let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCellBottomApp.self), for: indexPath) as? FeaturedAppCellBottomApp){
                    cell.bindData(todayArticle: data)
                   
                    return cell
                }
            }
            else if data.hasApp! && !data.withBottomApp!{
                if let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCellWithBigAppIcon.self), for: indexPath) as? FeaturedAppCellWithBigAppIcon){
                    cell.bindData(todayArticle: data)
                    
                    return cell
                }
            }
            else if data.briefDescription == ""
            {
                if let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppTopWhiteBg.self), for: indexPath) as? FeaturedAppTopWhiteBg){
                    cell.bindData(todayArticle: data)
                    
                    return cell
                }
            }else{
                if let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FeaturedAppCardCell.self), for: indexPath) as? FeaturedAppCardCell){
                    cell.bindData(todayArticle: data)
                    
                    return cell
                }
            }
        }
        
        return cell
    }
  

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header : GeneralHeaderCell
        
        if(kind == UICollectionElementKindSectionHeader){
            header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(GeneralHeaderCell.self), for: indexPath) as? GeneralHeaderCell)!
            
            let headerItem = HeaderItem(smallTitle: "ironPitch, V1.9".uppercased(), bigTitle: "IS Products", hideDiv: true)
            header.headerItem = headerItem
            //header.hideDivider()
            
            return header
        }
        
        return UICollectionViewCell()
    }
    
}
