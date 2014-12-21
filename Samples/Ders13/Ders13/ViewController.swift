//
//  ViewController.swift
//  Ders13
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var videoPlayer:MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func prepareVideoPlayer() {
        
        var videoURL = NSBundle.mainBundle().URLForResource("nasa", withExtension: "mp4")
        
        videoPlayer = MPMoviePlayerController(contentURL: videoURL)
        videoPlayer.movieSourceType = MPMovieSourceType.File
        videoPlayer.view.frame = self.view.bounds
        self.view.addSubview(videoPlayer.view)
    }

}




