//
//  OnboardingViewController.swift
//  NewsApp
//
//  Created by Burak AKCAN on 12.08.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: Views
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var customButton: UIButton!
    
    //MARK: Properties
    
    let defaults = UserDefaults.standard
    var slides:[OnboardingSlide] = []
    var currentPage = 0 {
        didSet{
            if currentPage == slides.count - 1{
                pageControl.currentPage = currentPage
                customButton.setTitle("Başla", for: .normal)
            }else{
                pageControl.currentPage = currentPage
                customButton.setTitle("Geç", for: .normal)
            }
        }
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
          OnboardingSlide(title: "En Güncel Haberler", description: "Haberlere  istediğiniz yerden , istediğiniz  zamanda ulaşın.", image:#imageLiteral(resourceName: "ic_1.jpg") ),
          OnboardingSlide(title: "Son Dakika Bildirimleri", description: "Bildirimler sayesinde gündemden hızlıca haberder olun.", image:#imageLiteral(resourceName: "ic_2.jpg") ),
          OnboardingSlide(title: "Popüler İçerikler", description: "Seçtiğiniz başlıklar sayesinde kendi gündeminizi yaratın.", image:#imageLiteral(resourceName: "ic_3.jpg") )
        
        ]

    }
    
    @IBAction func nextButtonClick(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            //Go to home page
            defaults.set(true, forKey: "firstLaunch")
            let navVC = storyboard?.instantiateViewController(withIdentifier: Constant.navigation) as! UINavigationController
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .flipHorizontal
            present(navVC, animated: true)
            
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
    
}
