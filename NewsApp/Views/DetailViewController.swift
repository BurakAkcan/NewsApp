//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
//MARK: - View
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var circularProgress: UIActivityIndicatorView!
    //MARK: - Properties
    var articleUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        

    }
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        //Check Url
        if articleUrl != nil{
            
            //Create Url
            guard let url = URL(string: articleUrl!) else{return}
            
            //Create urlRequest
            let request = URLRequest(url: url)
            
           
            circularProgress.startAnimating()
            
            //Load Webview
            webView.load(request)
        }
        
    }}

extension DetailViewController :WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        circularProgress.stopAnimating()
        circularProgress.alpha = 0
       
    }
}
