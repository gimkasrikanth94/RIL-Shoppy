//
//  ProductView.swift
//  RIL Shoppy
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct ProductView: View {
    @State var productDetails = ProductDetailModel()
    var body: some View {
        VStack(alignment: .leading){
            if let url = URL(string: productDetails.thumbnail){
                AsyncImage(
                   url: url,
                   placeholder: { Text("Loading ...") },
                   image: { Image(uiImage: $0).resizable() }
                ).aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.width*0.35, height: UIScreen.width*0.35)
            }else{
                Color.gray
                    .frame(width: UIScreen.width*0.35, height: UIScreen.width*0.35)

            }
            Text(productDetails.name)
            .lineLimit(2)
            HStack{
                if productDetails.discounted{
                    Text(String(productDetails.originalPrice))
                        .font(.system(size: 13))
                        .foregroundColor(Color.gray.opacity(0.9))
                        .strikethrough(true, color: Color.gray.opacity(0.9))
                }
                Text("\u{20B9}"+String(productDetails.currentPrice))
                    .font(.system(size: 13))
                if productDetails.discounted{
                    let discount = Int((Double(productDetails.currentPrice)/Double(productDetails.originalPrice))*100)
                    Text(String(discount)+"% off")
                        .font(.system(size: 13))
                        .foregroundColor(Color.green.opacity(0.9))
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipped()
        .cornerRadius(UIScreen.width*0.01)
        .shadow(color: .gray.opacity(0.8), radius: 5, x: -1, y: 1)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
