//
//  ViewController.swift
//  TrailerApp500672017
//
//  Created by Joshua William on 12/05/2019.
//  Copyright © 2019 Joshua William. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import AVKit

class ViewController: UIViewController {

    let refreshControl = UIRefreshControl()

    @IBOutlet weak var tableView: UITableView!
    var trailerList: [Trailer]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://appstubs.triple-it.nl/trailers/").responseData(completionHandler: {[weak self](response) in
            guard let jsonData = response.data else{return}
            let decoder = JSONDecoder()
            let objectsFromBackend = try? decoder.decode([Trailer].self, from: jsonData)
            self!.trailerList = objectsFromBackend!
            self?.tableView.reloadData()
        })
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TrailerView", bundle: nil), forCellReuseIdentifier: "TrailerView")
        title = "Trailers"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        setupRefreshControl()
        

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "TrailerView", bundle: nil), forCellReuseIdentifier: "TrailerView")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailerList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrailerView", for: indexPath) as! TrailerView
        
        cell.trailerTitle.text = trailerList?[indexPath.row].title.capitalized ?? ""
        cell.trailerDescription.text = trailerList?[indexPath.row].description ?? ""
        cell.trailerDescription.sizeToFit()
        let url = URL( string:  trailerList?[indexPath.row].poster_image ?? "")
        cell.trailerImage.kf.setImage(with: url)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let trailerDetailVC = storyboard.instantiateViewController(withIdentifier: "TrailerDetailViewController") as! TrailerDetailViewController
        trailerDetailVC.trailer = trailerList?[indexPath.row]
        self.navigationController?.pushViewController(trailerDetailVC, animated: true)
    }
}

