//
//  DataManager.swift
//  AppStore iOS 10
//
//  Created by Michael Iline  on 11/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import Foundation


class DataManager {
    let company: Company?
    func getDepartments(byName: Int) {
        company?.departmentsArray
    }
    
    init() {
        company = Company()
    }
    
}
