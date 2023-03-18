//
//  BmiData.swift
//  BodyMassIndex
//
//  Created by Adryan Eka Vandra on 19/03/23.
//

import Foundation
final class BmiData: ObservableObject {
    @Published var data: [BmiHistory] = []
    @Published var previewData: [BmiHistory] = [BmiHistory(category: BmiCategory(category: "Obesity", color: .orange), value: 45.2, date: Date.now)]
}
