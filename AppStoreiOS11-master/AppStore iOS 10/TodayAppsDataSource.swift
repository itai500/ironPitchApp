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
        return [FeaturedAppCardCell.self, FeaturedAppTopWhiteBg.self, FeaturedAppCellWithBigAppIcon.self,FeaturedAppCellBottomApp.self,]
//        return [FeaturedAppCardCell.self, FeaturedAppCardCell.self,FeaturedAppCardCell.self, FeaturedAppCellBottomApp.self,]

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
        let app1 = App(appName: "", appDesc: "", appID: 1, appCategory: "Leisure", appPrice: 0, appStory:"", appPhoto: "", screenShots: [""])
        let app5 = App(appName: "", appDesc: "", appID: 2, appCategory: "Leisure", appPrice: 0, appStory:"", appPhoto: "", screenShots: [""])
        let app6 = App(appName: "", appDesc: "", appID: 3, appCategory: "Leisure", appPrice: 0, appStory:"", appPhoto: "", screenShots: [""])
        let app7 = App(appName: "", appDesc: "", appID: 4, appCategory: "Leisure", appPrice: 0, appStory:"", appPhoto: "", screenShots: [""])



        
        //Mobile
        let app2 = App(appName: "Developer Solutions", appDesc: "Video Ad Network of Choice for Mobile App developers", appID: 2, appCategory: "Social Networking", appPrice: 0, appStory:"developers", appPhoto: "dev_solutions_card", screenShots: [""])

        //Install core
        let app3 = App(appName: "Digital Solutions", appDesc: "World Leading Data Driven Software Distribution Platform", appID: 3, appCategory: "Social Networking", appPrice: 0, appStory:"123", appPhoto: "digital", screenShots: [""])
        let todayArticle3 = TodayArticle(app: app3, smallTitle: "EXPLORE", bigTitle: "Display".uppercased(), briefDescription: "Pimp up your home with latest design classics and smart helpers.", article: "123", photo: "good_living", hasApp: true, withBottomApp: true)
        
        //Aura
      //  let app4 = App(appName: "Aura", appDesc: "Edit and Share your photos", appID: 4, appCategory: "Social Networking", appPrice: 0, appStory:"123", appPhoto: "dev_solutions_card", screenShots: [""])
        let todayArticle4 = TodayArticle(app: nil, smallTitle: "GET STARTED", bigTitle: "Entrprise Solutions".uppercased(), briefDescription: "Dynamic Content Recommandation platform for OEMs & Carriers", article: "123", photo: "enterprise", hasApp: false, withBottomApp: false)
        
        let todayArticle1 = TodayArticle(app: app1, smallTitle: "", bigTitle: "", briefDescription: "", article: "123", photo: "Brand2", hasApp: true, withBottomApp: false)
        let todayArticle2 = TodayArticle(app: app2, smallTitle: "", bigTitle: "Mobile".uppercased(), briefDescription: "", article: "123", photo: "developers", hasApp: true, withBottomApp: true)
        let todayArticle5 = TodayArticle(app: app5, smallTitle: "", bigTitle: "", briefDescription: "", article: "123", photo: "Developers2", hasApp: true, withBottomApp: false)
        let todayArticle6 = TodayArticle(app: app6, smallTitle: "", bigTitle: "", briefDescription: "", article: "123", photo: "enterprise2", hasApp: true, withBottomApp: false)
        let todayArticle7 = TodayArticle(app: app5, smallTitle: "", bigTitle: "", briefDescription: "", article: "123", photo: "digital2", hasApp: true, withBottomApp: false)
        
        return [todayArticle1, todayArticle5, todayArticle6, todayArticle7]
    
    }()
    
    
}
