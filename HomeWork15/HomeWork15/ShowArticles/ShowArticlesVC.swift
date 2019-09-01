//
//  ShowArticlesVC.swift
//  HomeWork15
//
//  Created by Pavel Procenko on 29/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class ShowArticlesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableArticles: UITableView!
    private var articles: [Article] = [] {
        
        didSet {
            tableArticles.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableArticles.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        
        NetworkManager.shared.loadArticles { result in
            
            switch result {
                
            case .success(let articles):
                self.articles = articles
                
            case .failure(let error):
                print(error)
                
                }
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let article = articles[indexPath.row]
        cell.title.text = article.title
        cell.body.text = article.body
        
        
        return cell
    }
    

 

}

