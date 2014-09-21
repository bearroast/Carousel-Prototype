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
    
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = introImageView.image!.size
        scrollView.delegate = self
    }

    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(scrollView.contentOffset.y)
        
        println("content offset: \(scrollView.contentOffset.y)")
        println("calling yOffset: \(yOffsets[0])")
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        introTile1ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile1ImageView.transform = CGAffineTransformScale(introTile1ImageView.transform, CGFloat(scale), CGFloat(scale))
        introTile1ImageView.transform = CGAffineTransformRotate(introTile1ImageView.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
