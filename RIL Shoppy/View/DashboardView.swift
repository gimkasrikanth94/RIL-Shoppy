//
//  DashboardView.swift
//  RIL Shoppy
//
//  Created by Srikanth Gimka on 17/08/22.
//

import SwiftUI



struct DashboardView: View {
    @State var list = [ProductDetailModel]()

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: UIScreen.width*0.05) {
                    ForEach((0..<list.count), id: \.self) { index in
                        ProductView(productDetails: list[index])
                    }
                }
                .padding()
            }
            .navigationBarTitle("Shoppy")
        }
        .onAppear(){
            APIService().loadData { data in
                self.list = data
            }
        }
        .preferredColorScheme(.light)
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
