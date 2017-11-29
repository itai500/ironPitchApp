//
//  TodayAppsDataSource.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents


class TodayAppsDataSource: Datasource {
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [GeneralHeaderCell.self]
    }
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [  FeaturedAppCardCell.self, FeaturedAppTopWhiteBg.self, FeaturedAppCellWithBigAppIcon.self,FeaturedAppCellBottomApp.self,]
    }
    
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return TodayAppsDataSource.dummyData.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return TodayAppsDataSource.dummyData[indexPath.row]
    }
    
    
    static var dummyData : [TodayArticle] = {
        
        //Brand
        let app1 = App(appName: "Brand Solutions", appDesc: "One Video Platform to Rule Them All", appID: 1, appCategory: "Leisure", appPrice: 0, appStory:"123", appPhoto: "stream_rail_icon", screenShots: [""])
        let todayArticle1 = TodayArticle(app: app1, smallTitle: "", bigTitle: "Brand".uppercased(), briefDescription: "", article: "123", photo: "architexture", hasApp: true, withBottomApp: true)
        
        //Mobile
        let app2 = App(appName: "Developer Solutions", appDesc: "Edit and Share your photos", appID: 2, appCategory: "Social Networking", appPrice: 0, appStory:"123", appPhoto: "dev_solutions_card", screenShots: [""])
        let todayArticle2 = TodayArticle(app: app2, smallTitle: "", bigTitle: "Mobile".uppercased(), briefDescription: "", article: "123", photo: "dev_solutions_card", hasApp: true, withBottomApp: true)

        //Install core
        let app3 = App(appName: "Display Solutions", appDesc: "Edit and Share your photos", appID: 3, appCategory: "Social Networking", appPrice: 0, appStory:"123", appPhoto: "dev_solutions_card", screenShots: [""])
        let todayArticle3 = TodayArticle(app: nil, smallTitle: "EXPLORE", bigTitle: "Display".uppercased(), briefDescription: "Pimp up your home with latest design classics and smart helpers.", article: "123", photo: "good_living", hasApp: true, withBottomApp: true)
        
        //Aura
        let app4 = App(appName: "Aura", appDesc: "Edit and Share your photos", appID: 4, appCategory: "Social Networking", appPrice: 0, appStory:"123", appPhoto: "dev_solutions_card", screenShots: [""])
        let todayArticle4 = TodayArticle(app: nil, smallTitle: "GET STARTED", bigTitle: "Aura".uppercased(), briefDescription: "", article: "123", photo: "air_plane", hasApp: true, withBottomApp: true)
        
        
        
        return [todayArticle1, todayArticle2, todayArticle3, todayArticle4]
    
    }()
    
    
}
