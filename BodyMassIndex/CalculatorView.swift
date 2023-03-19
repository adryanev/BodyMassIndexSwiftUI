//
//  CalculatorView.swift
//  BodyMassIndex
//
//  Created by Adryan Eka Vandra on 18/03/23.
//

import SwiftUI

struct CalculatorView: View {
    @State var weight: Double = 70
    @State var height: Double = 172
    @EnvironmentObject var data: BmiData
    
    
    var body: some View {
        let result = calculateBMI(weight: weight, height: height)
        VStack(spacing: 15) {
            BmiComponent(title: "Weight (kg)", defaultValue: 70 , sliderRange: 50...200){ value in
                self.weight = value
            }
            Divider()
            BmiComponent(title: "Height (cm)", defaultValue: 160, sliderRange: 50...200){ value in
                self.height = value
            }
            Divider()
            BmiResult(result: result)
            Button(action: {
                saveToHistory(result, data: data)
            }){
                Text("Save to History")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.padding(.top, 24)
            
            
        }.padding()
    }
}
func saveToHistory(_ result: Double, data: BmiData) -> Void {
    let entry = BmiHistory(category: determineBMICategory(result), value: result, date: Date.now)
    data.data.append(entry)
    
}
func determineBMICategory(_ bmi: Double) -> BmiCategory {
    switch bmi {
    case 0...18.4: return BmiCategory(category: "Underweight", color: .blue)
    case 18.5...24.9: return BmiCategory(category: "Normal", color: .green)
    case 25...39.9: return BmiCategory(category: "Overweight", color: .yellow)
    case 40...Double.infinity : return BmiCategory(category: "Obese", color: .orange)
    default: return BmiCategory(category: "Cannot Determine", color: .primary)
    }
}

func calculateBMI(weight: Double,height: Double ) -> Double {
    let convertedHeight = height / 100
    return (weight) / (convertedHeight * convertedHeight)
}
struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

struct BmiComponent: View {
    let title: String
    @State var defaultValue: Double
    let sliderRange: ClosedRange<Double>
    let onValueChanged: (_ value: Double) -> Void
    
    var body: some View {
        
        VStack(spacing: 25) {
            HStack {
                Text(title).fontWeight(.light).foregroundColor(.gray)
                Spacer()
                Text("\(defaultValue, specifier: "%.0f")").fontWeight(.bold).font(.system(size: 36))
            }
            Slider(value: Binding(
                get: {self.defaultValue}, set: {newValue in
                    self.defaultValue = newValue
                    onValueChanged(newValue)
                }
            ), in: sliderRange
            )
            
        }
    }
}

struct BmiResult: View {
    let result: Double
    
    var body: some View {
        let category = determineBMICategory(result)
        HStack{
            Text("Your Body Mass Index").foregroundColor(.gray)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(result, specifier: "%.2f")").fontWeight(.bold).font(.system(size: 42))
                Text(category.category).foregroundColor(category.color)
            }
        }
    }
}
