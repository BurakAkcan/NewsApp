//
//  Article.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import Foundation

struct Article:Decodable{
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlImage:String?
    var publishedAt:String?
    var content:String?
    
    enum CodingKeys:String,CodingKey{
        case author
        case title
        case description
        case url
        case urlImage = "urlToImage"
        case publishedAt
        case content
    }
}
