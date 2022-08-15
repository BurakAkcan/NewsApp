//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import Foundation

protocol ArticleModelProtocol{
    func articlesRetrieved(_ articles:[Article])
}


class NetworkService{
    
    var delegate:ArticleModelProtocol?
    
    func getArticle(){
        
        //Create String url
        let stringUrl = Constant.urlString + Constant.apiKey
        
        //Create URL Object
        guard let url = URL(string: stringUrl) else{
            print(" couldnt create url object")
            return}
        
        //Get url Session
        
        let session = URLSession.shared
        
        //Create data task
        
       let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil && data != nil{
                let decoder = JSONDecoder()
                do {
                  let articles = try decoder.decode(ArticleService.self, from: data!)
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles.articles ?? [Article]())
                    }
                    
                    
                } catch  {
                    print("error from parsing json")
                }
                
            }
        }
        
        // Startdata task
        
        dataTask.resume()
        
        
        
        
        
    }
    
}
