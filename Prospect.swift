//
//  Prospect.swift
//  encyapp
//
//  Created by Alvar Arias on 2022-09-22.
//

import SwiftUI
/// This class is used for mange the product added
///
/// Also manage informtion about the final proposal printed in pdf document.
class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var selProductID = "01"
    var selProductName = ""
    var selProductDiam = ""
    var selProductCat = ""
    var selProductPrice = ""
    var isProductSelected = false
    var numberOfProducts = 0
}

/// Prospects MVVM
///
/// Use main actor for use dinamic data in MVVM
@MainActor class Prospects: ObservableObject {
    
    @Published var people: [Prospect]
    /// total Belop from Cost View
    @Published var totalBelop: Int
    /// myDiscount  from Cost View
    @Published var myDiscount : String
    
    // extra info
    @Published var returnTime: String
    @Published var longSave30 : Int
    @Published var percentSaving: String
    @Published var energySaving: String
    
    
    @Published var newPropNum : String
    
    // Hidde element from Cost View
    @Published var isHidded = false

    init() {
        self.people = []
        self.totalBelop = 0
        self.newPropNum = ""
        self.myDiscount = ""
        self.longSave30 = 0
        self.returnTime = ""
        self.energySaving = ""
        self.percentSaving = ""
        
    }
}



