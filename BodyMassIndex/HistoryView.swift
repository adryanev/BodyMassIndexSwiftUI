//
//  HistoryView.swift
//  BodyMassIndex
//
//  Created by Adryan Eka Vandra on 18/03/23.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var data: BmiData
    
    var body: some View {
        Form {
            List(data.data.reversed(), id: \.self){ entry in
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(entry.date.formatted(date: .abbreviated, time: .shortened))")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    HStack {
                        Text("\(entry.value, specifier: "%.2f")")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(entry.category.category)")
                            .font(.system(size: 20))
                            .foregroundColor(entry.category.color)
                    }
                }
                
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static let data = BmiData()
    static var previews: some View {
       
        HistoryView().environmentObject(data)
    }
}
