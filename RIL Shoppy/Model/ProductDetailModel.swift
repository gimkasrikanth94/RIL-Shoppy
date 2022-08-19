//
//  ProductDetailModel.swift
//  RIL Shoppy
//
//  Created by Srikanth Gimka on 17/08/22.
//

import Foundation

public struct ProductDetailModel : Codable, Identifiable {
    public var id = UUID()
    public var name : String = ""
    public var link : String = ""
    public var currentPrice : Int = 0
    public var originalPrice : Int = 0
    public var discounted: Bool = false
    public var thumbnail : String = ""
    public var url : String = ""


    enum CodingKeys: String, CodingKey {

        case name = "name"
        case link = "link"
        case currentPrice = "current_price"
        case originalPrice = "original_price"
        case discounted = "discounted"
        case thumbnail = "thumbnail"
        case url = "query_url"

    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        link = try values.decodeIfPresent(String.self, forKey: .link) ?? ""
        currentPrice = try values.decodeIfPresent(Int.self, forKey: .currentPrice) ?? 0
        originalPrice = try values.decodeIfPresent(Int.self, forKey: .originalPrice) ?? 0
        discounted = try values.decodeIfPresent(Bool.self, forKey: .discounted) ?? false
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""

    }
    public init() {
         
    }

 }


