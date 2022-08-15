//
//  OnboardingCollectionViewCell.swift
//  NewsApp
//
//  Created by Burak AKCAN on 12.08.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    
    func setUp(_ slide:OnboardingSlide){
        slideImageView.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
    
}
