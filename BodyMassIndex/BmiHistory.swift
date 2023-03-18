//
//  BmiHistory.swift
//  BodyMassIndex
//
//  Created by Adryan Eka Vandra on 19/03/23.
//

import Foundation

struct BmiHistory: Hashable, Equatable {
    let category: BmiCategory
    let value: Double
    let date: Date
}
