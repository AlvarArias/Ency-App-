//
//  EnergyView.swift
//  encyapp
//
//  Created by Alvar Arias on 2022-07-15.
//

import SwiftUI

// MARK: New SelectedProductSingenton
/// Energy Singenton Object
///
/// Is a Singlenton object of Energy variables
class EnergySingenton: ObservableObject {
    static let shared = EnergySingenton()
    
    @Published var metricUnit = "mm"
    @Published var tempAmbient = ""
    @Published var desiredCool = ""
    @Published var theEnerySavings = "0"
    @Published var thePercentSaving = "0.0"
    @Published var theReturnTime = "0"
    @Published var theEnergySave30years = "0"
}

struct EnergyView: View {
    //Cal Binding
    @Binding var myCalcPercent: String
    @Binding var myEnergySavings: String
    
     // MARK: Object Problem
    @StateObject var myEnergy = EnergySingenton()
    
    // MARK: Object Build
    @StateObject var myBuild = BuildSingleton.shared
    
    // MARK: Prospect Env Obj
    @EnvironmentObject var prospects: Prospects

    @State var isMetric: Bool = false
    
    //@State var percentEficient = "30"
    @State var myNewPercent = "0"
    @State var kwPrice = "4"
    @State var newSaving = 0
    
    var calcProcent : String {
       let theHight = Double(myBuild.CellingHight) ?? 0
       let theFactor: Double = 0.003
       var theCalcEfficFactor : Double = 0
        
        if (theHight < 15000) {
        
        theCalcEfficFactor = theHight * theFactor
            
        } else {
            
        theCalcEfficFactor = 30
            
        }
        
        
        return String(Int(theCalcEfficFactor))
    }
    
    var newLet30 : String {
        
        let ret302 = (Int(energySavingMoney()) ) * 30
        
        return String(ret302)
        
    }
    
    // Calc tiempo del retorno
    var TimeReturn2 : String {
    
        let savemoney2 = Double (energySavingMoney())
        let timeRet2  = (Double(prospects.totalBelop) / savemoney2)
        
        //  return String(timeRet2)
        return String(format: "%.1f" ,timeRet2)
    }
        
    var body: some View {
        Form {
            Section(header: Text("ENERGY CALCULATION")) {
            
                HStack {
                    Text("Building Width: ")
                    Text(makeSpace(mytex: myBuild.BuildWidth) + "  " + myEnergy.metricUnit).background(.ultraThickMaterial)
                    Spacer()
                    Text("Building Lenght: ")
                    Text(makeSpace(mytex: myBuild.BulidLong) + "  " + myEnergy.metricUnit).background(.ultraThickMaterial)
                    Spacer()
                    Text("Building Height: ")
                    //Text(makeSpace(mytex: myBuild.FlakUnderside) + "  " + myEnergy.metricUnit).background(.ultraThickMaterial)
                    Text(makeSpace(mytex: myBuild.CellingHight) + "  " + myEnergy.metricUnit).background(.ultraThickMaterial)
                }
                
                HStack{
                    Text("Procentsats %")
                    //TextField("% Eficency Energy" ,text:($calcProcent))
                    Text(calcProcent)
                        
                }
           
                HStack {
                Text("Ambient temperature °C")
                    TextField("temperature between 25 and 42 °C", text: $myEnergy.tempAmbient)
                }
                HStack {
                Text("Desired cooling effect")
                    TextField("1.1 to 1.5", text: $myEnergy.desiredCool)
                }
            }
            
            Section(header: Text("Calculation")){
                HStack {
                Text("Kundens energiförbrukning per år: ")
                Spacer()
                    Text(String(Int(myBuild.energyConsumption)?.formattedWithSeparator ?? "0" ) + " KW").background(.ultraThinMaterial)
                }
                    
                HStack {
                Text("Energy Savings: ")
                Spacer()
                Text(energySaving()).background(.ultraThickMaterial)
                }
                HStack {
                Text("Ny energi förbrukar efter besparingar: ")
                Spacer()
                    Text(newEnergyCon()).background(.ultraThinMaterial)
                }
            }
            
            Section(header: Text("Ekonomi")){
                
                HStack {
                Text("KW Price")
                    Spacer()
                    Text(kwPrice + "  SEK").background(.ultraThickMaterial)
                }
                HStack {
                Text("Saving $ per year")
                Spacer()
                    Text(String(energySavingMoney().formattedWithSeparator) + " SEK")
                }
                
                
                
                HStack {
                Text("Cost of the proyect")
                Spacer()
                    Text(String(prospects.totalBelop.formattedWithSeparator) + " SEK")
                }
                
                HStack {
                Text("Återbetalningstid:")
                Spacer()
                    //Text((myEnergy.theReturnTime) + " År")
                    Text((TimeReturn2) + " År")
                }
        
                
                HStack {
                Text("Ekonomisk besparing på 30")
                Spacer()
                    Text(String(Int(newLet30)!.formattedWithSeparator) + " SEK")
                }
                
                
                HStack {
                    Text("Save values")
                    Spacer()
                    Button {
                        print("Save")
                        saveNewValues()
                        
                        // asign % eficencia
                        myEnergy.thePercentSaving = calcProcent
                        print("myEnergy.thePercentSaving  \(myEnergy.thePercentSaving)")
                        
                        
                        
                    } label: {
                        Image(systemName: "checkmark")
                    }

                }
                
            }
            .onAppear {
                print("Value prospect Calc Energy")
                print(prospects.totalBelop)}
            
            
            Section {
                Button(action: {
                    print("Reset action")
                    myEnergy.desiredCool = ""
                    myEnergy.tempAmbient = ""
                    if isMetric {
                        isMetric = false
                    }
                    
                    
                }) {
                    Text("Reset all fields")
                }
            }
        }
        .onAppear {
            
        }
        .navigationBarTitleDisplayMode(.inline)
    
        .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        myProgressView(myoption: mySelectionNum.init(isCustomers: false, isEnergy: true))
                    }
            }
        
        
        }
    
    /// Calculate new energy customer cconsume
    func newEnergyCon() -> String {
        var myCalcConsum = 0

        if (!myBuild.energyConsumption.isEmpty) {
            let myConsum = Double(myBuild.energyConsumption) ?? 0
            let myProcent = Double(calcProcent) ?? 0
            myCalcConsum = (Int(myBuild.energyConsumption) ?? 0) - Int((myConsum) * (myProcent)/100)
        }
        
        return String(myCalcConsum.formattedWithSeparator) + " KW"
    }
    
    /// Calculate customer energy saving
    func energySaving() -> String {
        var myCalcConsum = 0

        if (!myBuild.energyConsumption.isEmpty) {
            let myConsum = Double(myBuild.energyConsumption) ?? 0
            let myProcent = Double(calcProcent) ?? 0
            myCalcConsum = Int((myConsum) * (myProcent)/100)
        }
        
        return String(myCalcConsum.formattedWithSeparator) + " KW"
    }
    
    /// calculate my save percent
    func calPercent() -> String {
        var myPercent: Double = 0.0
        if (!myBuild.FlakUnderside.isEmpty) {
            let percent: Double = 3
            let theHight = Double(myBuild.FlakUnderside) ?? 0
            myPercent = (percent * theHight/1000)
        }
        
        return String(myPercent)
    }
    
    /// Make en space on text
    func makeSpace(mytex: String) -> String {
        let toNumber = Int(mytex)
        let result: String = String(toNumber?.formattedWithSeparator ?? "0")
        return (result)
    }

    /// Calculate KW saving
    func calKWSaving() -> String {
        
        let theKW = Int(kwPrice) ?? 4
        let theSaving = energySaving()
        let theSaving2 = Int(theSaving) ?? 5
        let resultat = String(theKW * theSaving2)
        
        return resultat
    }
    
    /// Calc energy saving money
    func energySavingMoney() -> Int {
        var myCalcConsum = 0

        if (!myBuild.energyConsumption.isEmpty) {
            let myConsum = Double(myBuild.energyConsumption) ?? 0
            let myProcent = Double(calcProcent) ?? 0
            let theKwPrice = Double(kwPrice) ?? 0
            myCalcConsum = Int(((myConsum) * (myProcent)/100) * theKwPrice)
            
        }
        
        return myCalcConsum
    }
    
    func saveNewValues() {
        myEnergy.theEnerySavings = String(energySavingMoney())
        print("myEnergy.theEnerySavings")
        print(myEnergy.theEnerySavings)
        
        // Calc tiempo del retorno
        let savemoney = Double (energySavingMoney())
        let timeRet  = (Double(prospects.totalBelop) / savemoney)
        print("timeRet")
        print(timeRet)
        prospects.returnTime = String(format: "%.1f" ,timeRet)
        myEnergy.theReturnTime = String(format: "%.1f" ,timeRet)
        print(myEnergy.theReturnTime)
        
        // Calc energy saving in 30 år
        let ret30 = (Int(energySavingMoney()) ) * 30
        print(ret30)
        prospects.longSave30 = ret30
        myEnergy.theEnergySave30years = String(ret30)
        print(myEnergy.theEnergySave30years)
        
        // Energibesparing med ENCY HVLS Fläktlösning
        //myEnergy.thePercentSaving
        prospects.percentSaving = calcProcent
        
        //Energibesparing med ENCY HVLS Fläktlösning
        // myEnergy.theEnerySavings
        prospects.energySaving = energySaving()
 
    }
    
    func newValue() -> Int {
        
        var nuevoProcentaje : Double = 0
        
        let altoDelTecho : Double = (Double(myBuild.CellingHight) ?? 0) / 1000
        
        if (altoDelTecho >= 15) {
            return 35
        } else {
            nuevoProcentaje = altoDelTecho * 0.03
            return Int(nuevoProcentaje)
        }
    }
 }


struct EnergyView_Previews: PreviewProvider {
    static var previews: some View {
        EnergyView(myCalcPercent: .constant("20"), myEnergySavings: .constant("0"))
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

