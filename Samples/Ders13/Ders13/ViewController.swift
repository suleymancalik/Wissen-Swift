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
        
//        prepareVideoPlayer(MPMovieSourceType.File)
        prepareVideoPlayer(MPMovieSourceType.Streaming)
        videoPlayer.play()
    }
    
    
    func prepareVideoPlayer(sourceType:MPMovieSourceType) {
        
        if sourceType == MPMovieSourceType.File {
            var videoURL = NSBundle.mainBundle().URLForResource("nasa", withExtension: "mp4")
            videoPlayer = MPMoviePlayerController(contentURL: videoURL)
        }
        else {
            var streamURL = NSURL(string: "http://www.nasa.gov/multimedia/nasatv/NTV-Public-IPS.m3u8")
            videoPlayer = MPMoviePlayerController(contentURL: streamURL)
        }
        
        videoPlayer.movieSourceType = sourceType
        
        videoPlayer.view.frame = self.view.bounds
        self.view.addSubview(videoPlayer.view)
        
        videoPlayer.repeatMode = MPMovieRepeatMode.One
        videoPlayer.controlStyle = MPMovieControlStyle.None
        videoPlayer.scalingMode = MPMovieScalingMode.AspectFit
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        videoPlayer.view.frame.size = size
    }
    
    
}




