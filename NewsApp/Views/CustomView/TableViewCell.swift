//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var articleDisplay:Article?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displyArticle(_ article:Article){
        articleDisplay = article
        
        articleImage.alpha = 0
        titleLabel.alpha = 0
        
        
        titleLabel.text = articleDisplay!.title
        
        //Add Animation
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.titleLabel.alpha = 1
            
        }, completion: nil)
        
        
        let urlString = articleDisplay!.urlImage
        
       
        
        if articleDisplay!.urlImage == urlString{
            DispatchQueue.main.async {
                self.articleImage.kf.setImage(with: self.articleDisplay?.urlImage?.asUrl)
                
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                    self.articleImage.alpha = 1
                    
                }, completion: nil)
            }
        }
        
        
      
       
        
    }

  

}
