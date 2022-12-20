//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Nicholas Puig on 12/20/22.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation: MainInformation
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    var body: some View {
        Form {
              TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
              TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
              Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
              }
              .listRowBackground(listBackgroundColor)
              Picker(selection: $mainInformation.category, label:
                      HStack {
                        Text("Category")
                        Spacer()
                        Text(mainInformation.category.rawValue)
                      }) {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                  Text(category.rawValue)
                }
           }
              .listRowBackground(listBackgroundColor)
              .pickerStyle(MenuPickerStyle())
            }
        .foregroundColor(listTextColor)
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                            description: "Test Description",
                                                            author: "Test Author",
                                                            category: .breakfast)
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
    }
}
