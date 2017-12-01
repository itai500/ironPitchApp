//
//  DataManager.swift
//  AppStore iOS 10
//
//  Created by Michael Iline  on 11/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import Foundation


class DataManager: NSObject {
    static var sharedInstance : DataManager = DataManager()
    var company: Company?

    override init() {
        self.company = Company()
    }
    
    public func getCompany() {
        Service.sharedInstance.getIronSourceData(completed:{(company) in
            self.company = company
        })
    }
    
    public func getDepartment(name: String) -> Department {
       return self.company!.departments.object(forKey: name) as! Department
    }
    
    var keyPointIcons: [String] = [
        "camera_app",
        "camera_app",
        "camera_app"
        
    ]
    public func getKeyPointsIcon(appName: String) -> String {
        return keyPointIcons[0]
    }
    public func getKeyPointsIcons() -> [String] {
        return keyPointIcons
    }

    var keyPointImages: [String] = [
        "Brands_Partners",
        "Carriers_partners",
        "App_developers_partners"
    ]
    public func getKeyPointImage(appName: String) -> String {
        return keyPointImages[0]
    }
    
    public func getKeyPointImages() -> [String] {
        return keyPointImages
    }
    
    var keyPointTitles: [String] = [
        "Brands_Partners",
        "Carriers_partners"
    ]
    public func getKeyPointTitle(index: Int) -> String {
        return keyPointTitles[index]
    }

    public func getKeyPointTitles() -> [String] {
        return keyPointTitles
    }
}
