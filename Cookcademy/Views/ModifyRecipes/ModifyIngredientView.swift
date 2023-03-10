//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Nicholas Puig on 12/20/22.
//

import SwiftUI
 
struct ModifyIngredientView: View {
  @Binding var ingredient: Ingredient
 
  var body: some View {
    VStack {
      Form {
        TextField("Ingredient Name", text: $ingredient.name)
        Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
          HStack {
            Text("Quantity:")
            TextField("Quantity",
                      value: $ingredient.quantity,
                      formatter: NumberFormatter.decimal)
              .keyboardType(.numbersAndPunctuation)
          }
        }
        Picker(selection: $ingredient.unit, label:
                HStack {
                  Text("Unit")
                  Spacer()
                  Text(ingredient.unit.rawValue)
                }) {
          ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
            Text(unit.rawValue)
          }
        }
        .pickerStyle(MenuPickerStyle())
      }
    }
  }
}
 
extension NumberFormatter {
  static var decimal: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }
}

struct ModifyIngredientView_Previews: PreviewProvider {
  @State static var emptyIngredient = Ingredient(name: "",
                                                 quantity: 1.0,
                                                 unit: .none)
  static var previews: some View {
    NavigationView {
      ModifyIngredientView(ingredient: $emptyIngredient)
    }
  }
}
