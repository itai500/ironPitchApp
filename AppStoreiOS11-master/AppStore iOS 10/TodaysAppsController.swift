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
        if let name = app!.appStory {
            deptDetailVC.departmentData = DataManager.sharedInstance.getDepartment(name: name)
        }
        
        let items = ["angry","war", "clan"]
        var apps: [App] = [App]()
        
//        let app1 = App(appName: "Injustice", appDesc: "When iconic superheroes collide", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "batmandem",
//                       screenShots: [""])
//
//        let app2 = App(appName: "Cubic Cosmos", appDesc: "When geometry arrives space", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "cubic_cosmos", screenShots: [""])
//
//        let app3 = App(appName: "Monument Valley", appDesc: "Inside the iconic sequel", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "mirage", screenShots: [""])
        
        let app1 = App(appName: "Playable 360", appDesc: "New type of Ad Unit", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "batmandem",
                       screenShots: [""], appWebViewDemo: "https://www.apple.com", appVideoDemo:"https://content.jwplatform.com/videos/kaUXWqTZ-640.mp4")
        
        let app2 = App(appName: "COCA COLA UA", appDesc: "Top Partner with MOAT", appID: 2, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "cubic_cosmos", screenShots: [""], appWebViewDemo:"https://www.apple.com", appVideoDemo:"https://content.jwplatform.com/videos/kaUXWqTZ-640.mp4")
        
        let app3 = App(appName: "Custom Offerwall", appDesc: "Holidays Special", appID: 3, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "mirage", screenShots: [""], appWebViewDemo:"", appVideoDemo: "https://content.jwplatform.com/videos/kaUXWqTZ-640.mp4")
        
        apps = [app1, app2, app3]
        let headerItemGames = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Product Demos", hideDiv: false)
        
        var configGames = ViewControllerConfigurator()
        configGames.appsArray = apps
        configGames.listArray = items
        configGames.headerItem = headerItemGames
        configGames.subHeaderTitle = "The Latest IS Demos"
        deptDetailVC.config = configGames
        
        self.show(deptDetailVC, sender: deptDetailVC)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setSelectedApp(app: (self.datasource?.item(indexPath) as? TodayArticle)?.app)
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
