//
//  TrailerDetailViewController.swift
//  TrailerApp500672017
//
//  Created by Joshua William on 13/05/2019.
//  Copyright © 2019 Joshua William. All rights reserved.
//

import Foundation
import UIKit
import AVKit

final class TrailerDetailViewController: UIViewController {
    


    
    @IBOutlet weak var trailerStill: UIImageView!
    @IBOutlet weak var trailerDescription: UILabel!
    @IBOutlet weak var trailerPoster: UIImageView!
    @IBOutlet weak var trailerTitle: UILabel!
    
    @IBOutlet weak var trailerVideo: UIButton!
    
    var trailer: Trailer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.startAnimating()


        trailerVideo.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        let urlPoster = URL(string: trailer?.poster_image ?? "")
        trailerPoster.kf.setImage(with: urlPoster)
        let urlStill = URL(string: trailer?.still_image ?? "")
        trailerTitle.text = trailer?.title
        trailerStill.kf.setImage(with: urlStill)
        trailerDescription.text = trailer?.description
        
    }
    
    @objc func buttonClicked(sender: UIButton){
       print("EEEY")
        let videoURL = URL(string: trailer?.url ?? "")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }

    }
    
}
