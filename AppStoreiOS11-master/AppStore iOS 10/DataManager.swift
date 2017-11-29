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

}
