//
//  String+Extension.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import Foundation

extension String{
    var asUrl:URL?{
        return URL(string: self)
    }
}


//extension String {
//    var asUrl:URL?{
//        return URL(string: self)
//    }
//}


