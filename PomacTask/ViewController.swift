//
//  ViewController.swift
//  PomacTask
//
//  Created by Khaled Rashed on 8/27/20.
//  Copyright © 2020 Khaled Rashed. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet var topView: UIView!
    @IBOutlet var generalView: UIView!
    @IBOutlet var newsTableView: UITableView!


    let cellId = "cell"
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()

        generalView.addShadowCornerRedius(cornerRadius: 10)

        newsTableView.register(UINib(nibName: "MainNewsCell", bundle: nil), forCellReuseIdentifier: cellId)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.backgroundColor = #colorLiteral(red: 0.952861011, green: 0.9529944062, blue: 0.9528189301, alpha: 1)
        generalView.backgroundColor = #colorLiteral(red: 0.952861011, green: 0.9529944062, blue: 0.9528189301, alpha: 1)

        loadArticles()

    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)

          navigationController?.setNavigationBarHidden(true, animated: true)
      }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }



    func loadArticles() {

        API.getMostPopularArticle(api_key: "Gh8yFDn5VFJJZvJciCEhFy1NPHCFLxGH") { (error: Error?, articles: [Article]?) in

            if let articles = articles {
                self.articles = articles
                self.newsTableView.reloadData()
            }

        }


    }




}


extension ViewController: UITableViewDelegate, UITableViewDataSource {



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MainNewsCell
        cell.newsTitleLbl.text = articles[indexPath.row].title
        cell.newsDetailsLbl.text = articles[indexPath.row].byline
        cell.newsImg.sd_setImage(with: URL(string: articles[indexPath.row].media[0].mediaMetadata[1].url))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = #colorLiteral(red: 0.952861011, green: 0.9529944062, blue: 0.9528189301, alpha: 1)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailsVC {



            vc.article = articles[indexPath.row]
            
            


            navigationController?.pushViewController(vc, animated: true)

        }



    }


}

