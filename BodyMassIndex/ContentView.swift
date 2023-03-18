//
//  ContentView.swift
//  BodyMassIndex
//
//  Created by Adryan Eka Vandra on 18/03/23.
//

import SwiftUI
enum Pages: String {
    case calculator = "Calculator"
    case history = "History"
}
struct ContentView: View {
    @State private var activePage: Pages = Pages.calculator
    let pages = [Pages.calculator, Pages.history]
    var body: some View {
        NavigationView {
            VStack {
                Picker("ActivePage", selection: $activePage){
                    ForEach(pages, id: \.self) { page in
                        Text(page.rawValue)
                    }
                    
                }.pickerStyle(.segmented)
                    .navigationTitle("Body Mass Index")
                    .padding()
                
                if activePage == Pages.calculator {
                    CalculatorView()
                } else {
                    HistoryView()
                }
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BmiData())
    }
}
