//
//  ViewController.swift
//  NewsApp
//
//  Created by Burak AKCAN on 11.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: View
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var model = NetworkService()
    var articles:[Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      // tableView.delegate = self
       // tableView.dataSource = self
        
        
        
        model.delegate = self
        model.getArticle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else{return}
        let article = articles[indexPath!.row]
        if segue.identifier == "toDetail"{
            let detailVC = segue.destination as! DetailViewController
            detailVC.articleUrl = article.url
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
        
    }


}

extension ViewController:ArticleModelProtocol{
    func articlesRetrieved(_ articles: [Article]) {
        //set the article property
        self.articles = articles
        
        //RefreshtableView
        tableView.reloadData()
    }
   
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as! TableViewCell
        cell.displyArticle(articles[indexPath.row])
        return cell
    }
    

}
