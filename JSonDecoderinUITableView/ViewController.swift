//
//  ViewController.swift
//  JSonDecoderinUITableView
//
//  Created by Awanish Sharma on 06/06/20.
//  Copyright © 2020 Awanish Sharma. All rights reserved.
//

import UIKit

struct ArticleData : Codable {
    let createdAt : String
    let content : String
    let likes : Int
    let comments : Int
    let media : Media
    let user : User
}

struct Media: Codable {
    let image : String
    let title : String
    let url : String
    
}

struct User : Codable {
    let name : String
    let avatar : String
    let designation : String
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrArticleData = [ArticleData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        getArticleData()
    }
    func getArticleData() {
        
        let url = URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=1&amp;li")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //do {
           //if let data = data {
             //   let articlesData = try? JSONDecoder().decode([ArticleData].self, from: data)
              // print(articlesData ?? 0)
             //  print(articlesData![0].media.title)
             //   }
           //} catch {
               //print("Parsing Errr")
           //}
            
            do {
                if error == nil {
                    self.arrArticleData = try JSONDecoder().decode([ArticleData].self, from: data!)
                    for articleDataFromJson in self.arrArticleData {
                        print(articleDataFromJson.comments)
                    }
                }
                
            } catch {
                print("Parsing Errr")
            }
        }.resume()
            
    }
    
    //func numberOfSections(in tableView: UITableView) -> Int {
       // return 1
    //}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrArticleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        cell.articleContentLbl.text = arrArticleData[indexPath.row].content
        cell.titleLbl.text = arrArticleData[indexPath.row].createdAt
        return cell
    }
    
}
