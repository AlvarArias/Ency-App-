//
//  ProblemView.swift
//  encyapp
//
//  Created by Alvar Arias on 2022-07-12.
//

import SwiftUI

/// Problem Singleton Object
///
/// Is a Singlenton object of Customers problems
/// This object save the information Customers problems.
/// You use this information on the document view and PDF
class ProblemSingenton: ObservableObject {
    static let shared = ProblemSingenton()
    // Problems
    @Published var condens = false
    @Published var ventilation = false
    @Published var airHot = false
    @Published var airCol = false
    @Published var energyCost = false
    // Nedds
    @Published var hotEfficiency = false
    @Published var airQuality = false
    @Published var needCondens = false
    @Published var customersConfort = false
    // Dates
    @Published var firstMeeting = Date()
    @Published var fisicVisit = Date()
    @Published var discusionVisit = Date()
    @Published var instalationDate = Date()
    // Extra Info
    @Published var extraInfo = ""
    @Published var extraNotes = ""
}

struct ProblemView: View {
    
    // MARK: Object Problem
    @StateObject var myProblem = ProblemSingenton.shared
        
    var body: some View {
        Form {
          
        Section(header: Text("PROBLEM")){
            Group {
                Toggle("Kondens", isOn: $myProblem.condens)
                Toggle("Luftkvalitet Ventilation", isOn: $myProblem.airQuality)
                Toggle("Luftkvalitet för varmt", isOn: $myProblem.airHot)
                Toggle("Luftkvalitet för kallt", isOn: $myProblem.airCol)
                Toggle("Energikostnader", isOn: $myProblem.energyCost)
            }
        }
            Section(header: Text("BEHOV")){
            Group {
                Toggle("Värme Energieffektivisering", isOn: $myProblem.hotEfficiency)
                Toggle("Luftkvalitet / Ventilation / Sommarfläkt", isOn: $myProblem.airQuality)
                Toggle("Kondens", isOn: $myProblem.condens)
                Toggle("Gäster confort", isOn: $myProblem.customersConfort)
                }
            }
        
            Section(header: Text("Datum ")){
                Group {
                    
                    DatePicker( "Första möte/teams/tlf datum",selection: $myProblem.firstMeeting,displayedComponents: [.date])
                   
                    DatePicker("Fysiskt Besöksdatum", selection: $myProblem.fisicVisit, displayedComponents: .date)
                    
                    DatePicker("Återkom för vidare diskussion datum", selection: $myProblem.discusionVisit, displayedComponents: .date)
                    
                    DatePicker("Önskat installationsdatum", selection: $myProblem.instalationDate, displayedComponents: .date)
                    
                    Text("Övrigt")
                    TextField("Skriv här för att redigera", text: $myProblem.extraInfo)
                    
                    Text("Övrigt Anteckningar")
                    TextField("Skriv här för att redigera", text: $myProblem.extraNotes)
                    
                }
            }
        }
        .navigationTitle("Kunder problem")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        myProgressView(myoption: mySelectionNum(isCustomers: false, isProblem: true))
                    }
            }
    }

}

struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView()
    }
}
