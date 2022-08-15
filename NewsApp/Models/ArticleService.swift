//
//  ArticleService.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import Foundation

struct ArticleService:Decodable{
    
    var totalResult:Int?
    var status:String?
    var articles:[Article]?
    
}
