//
//  IntroViewController.swift
//  Carousel Prototype
//
//  Created by Bjørn Eivind Rostad on 9/20/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!

    @IBOutlet weak var introTile1ImageView: UIImageView!
    @IBOutlet weak var introTile2ImageView: UIImageView!
    @IBOutlet weak var introTile3ImageView: UIImageView!
    @IBOutlet weak var introTile4ImageView: UIImageView!
    @IBOutlet weak var introTile5ImageView: UIImageView!
    @IBOutlet weak var introTile6ImageView: UIImageView!
    
    
    var introTiles : [UIImageView]!
    
    // Values for position, scale and rotation for the 6 images
    var yOffsets : [Float] = [-295, -340, -315, -488, -410, -490]
    var xOffsets : [Float] = [-50, 75, -66, 10, 100, -25]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    // Converts values
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Putting the images into an array
        introTiles = [introTile1ImageView, introTile2ImageView, introTile3ImageView, introTile4ImageView, introTile5ImageView, introTile6ImageView]

        // Setting the size of the scrollview
        scrollView.contentSize = introImageView.image!.size
        scrollView.delegate = self
        
        
        // Making sure the images are loaded
        var images = introTiles.count
        var image = 0
        for image in 0..<images {
            introTiles[image].transform = CGAffineTransformMakeTranslation(CGFloat(xOffsets[image]), CGFloat(yOffsets[image]))
            introTiles[image].transform = CGAffineTransformScale(introTiles[image].transform, CGFloat(scales[image]), CGFloat(scales[image]))
            introTiles[image].transform = CGAffineTransformRotate(introTiles[image].transform, CGFloat(Double(rotations[image]) * M_PI / 180))
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        // Scroll position
        var offset = Float(scrollView.contentOffset.y)
        
        if offset > 0 && offset < 568 {
            
            // Finding the number of images and start count at 0
            var images = introTiles.count
            var image = 0
        
        
            // Loop through each image to update the scale, position and rotation
            for image in 0..<images {
                var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[image], r2Max: 0)
                var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[image], r2Max: 0)
                var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[image], r2Max: 1)
                var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[image], r2Max: 0)
                
                introTiles[image].transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
                introTiles[image].transform = CGAffineTransformScale(introTiles[image].transform, CGFloat(scale), CGFloat(scale))
                introTiles[image].transform = CGAffineTransformRotate(introTiles[image].transform, CGFloat(Double(rotation) * M_PI / 180))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
