//
//  TestingCoreDataView.swift
//  encyapp
//
//  Created by Alvar Arias on 2022-11-25.
//

import SwiftUI
/// Testing Save CORE DATA
///
/// View for testing Core data and Proposals
struct TestingCoreDataView: View {

    // leer datos
    @Environment(\.managedObjectContext) var myEncyProposal
    // Leer y grabar datos
    @FetchRequest(sortDescriptors: []) var encyProposal: FetchedResults<EncyProposal>
    
    
    var body: some View {
        VStack {
            List(encyProposal){ proposal in
                Text(proposal.kundname ?? "no kund name")
                Text(proposal.kundkontakt ?? "no kund name")
                Text(proposal.dateProp ?? "no kund name")
                Text(proposal.kundnum ?? "no kund name")
                Text(proposal.kundname ?? "no kund name")
                Text(proposal.propnum ?? "no kund name")
                
            }
            Button("Add") {
                let proposal = EncyProposal(context: myEncyProposal)
                proposal.kundname = "Ency AB"
                proposal.totalProp = "98000"
                proposal.dateProp = "01-01-2020"
                proposal.kundkontakt = "Peter"
                proposal.kundnum = "001"
                proposal.propnum = "00010001"
                
                try? myEncyProposal.save()
                 
            }
        }
    }
}

struct TestingCoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        TestingCoreDataView()
    }
}
