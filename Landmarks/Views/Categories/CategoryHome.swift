//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Dermot Boyle on 29/9/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self){
                    key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }
        .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {

    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
