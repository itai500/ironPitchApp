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
           // deptDetailVC.departmentData = DataManager.sharedInstance.getDepartment(name: name)
        }
        
        let items = ["angry","war", "clan"]
        var apps: [App] = [App]()
        
//        let app1 = App(appName: "Injustice", appDesc: "When iconic superheroes collide", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "batmandem",
//                       screenShots: [""])
//
//        let app2 = App(appName: "Cubic Cosmos", appDesc: "When geometry arrives space", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "cubic_cosmos", screenShots: [""])
//
//        let app3 = App(appName: "Monument Valley", appDesc: "Inside the iconic sequel", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "mirage", screenShots: [""])
        
        let app1 = App(appName: "Playable 360", appDesc: "New type of Ad Unit", appID: 1, appCategory: "RV Ads", appPrice: 0, appStory:"123", appPhoto: "HomescapesEndCard",
                       screenShots: [""], appWebViewDemo: "http://supersonicads-a.akamaihd.net/users/playables/homescapes/index.html?isStandalone=true", appVideoDemo:"https://content.jwplatform.com/videos/kaUXWqTZ-640.mp4")
        
        let app2 = App(appName: "COCA COLA UA", appDesc: "Top Partner with MOAT", appID: 2, appCategory: "Brand", appPrice: 0, appStory:"123", appPhoto: "coca_cola_endcard", screenShots: [""], appWebViewDemo:"", appVideoDemo:"https://supersonicads-a.akamaihd.net/test/hackaton2017/pitchapp/Coca-Cola__Brand_New_Look._Same_Great_Taste.mp4")
        
        let app3 = App(appName: "Custom Offerwall", appDesc: "Holidays Special", appID: 3, appCategory: "Offerwall", appPrice: 0, appStory:"123", appPhoto: "OfferWall_custom", screenShots: [""], appWebViewDemo:"https://supersonicads-a.akamaihd.net/adunit/dist/prod/adUnitStandalone.html?localTime=1512025409633&format=openRTB&bundleId=com.ironsrcmobile.UltraApp&batteryLevel=-100&deviceVolume=0&deviceModel=iPad4%2C4&scope=8&applicationKey=45e3185d&deviceIds%5BIFA%5D=09188F19-78BB-443A-BB76-3D600BAB62CE&appVersion=6.7.3&deviceLanguage=EN&mnc=0&gpi=false&country=&referrerId=mobileApps2Go&controllerId=1512025407472_0.33921600014210296&applicationUserId=ggggg&debug=3&pScore=undefined&deviceOs=ios&v=2.2.10&appOrientation=none&deviceScreenScale=2&deviceOEM=Apple&iphoneAppOnIpadDevice=0&jb=false&diskFreeSize=760&timezoneOffset=-120&baseUrl=https%3A%2F%2Fow-gateway.supersonicads.com%2Fgateway%2Fofferwall%2Frequest&allowArbitraryLoads=true&mcc=0&suppressPageImpression=1&referrerBanners=20&deviceWidthDP=1024&deviceOSVersion=11.0.3&deviceHeightDP=768&isLimitAdTrackingEnabled=false&sdkAbName=7.1&SDKVersion=5.47&connectionType=wifi&placementId=0", appVideoDemo: "https://content.jwplatform.com/videos/kaUXWqTZ-640.mp4")
        
        let arrSection = App(appName: "AR Video",
                             appDesc: "Augmented reality advertising",
                             appID: 3,
                             appCategory: "AR Video",
                             appPrice: 0,
                             appStory:"123",
                             appPhoto: "ar_custom",
                             screenShots: [""],
                             appWebViewDemo:"",
                             appVideoDemo: "https://ssastatic.s3.amazonaws.com/test/hackaton2017/pitchapp/CSR_Racing-IronSourceAR.mp4"
        )
        
        apps = [app1, app2, app3, arrSection]
        
        let headerItemGames = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Product Demos", hideDiv: false)
        
        var configGames = ViewControllerConfigurator()
        configGames.appsArray = apps
        configGames.listArray = items
        configGames.headerItem = headerItemGames
        configGames.subHeaderTitle = "Key Selling Points"
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
            
            let headerItem = HeaderItem(smallTitle: "ironPitch, V1.9".uppercased(), bigTitle: "Solutions", hideDiv: true)
            header.headerItem = headerItem
            //header.hideDivider()
            
            return header
        }
        
        return UICollectionViewCell()
    }
    
}
