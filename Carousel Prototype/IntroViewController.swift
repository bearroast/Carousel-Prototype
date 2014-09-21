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
    
    
    var yOffsets : [Float] = [-295, -340, -315, -488, -410, -280]
    var xOffsets : [Float] = [-50, 75, -66, 10, 100, -15]
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
        
        var txTile1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
        var tyTile1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
        var scaleTile1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
        var rotationTile1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)

        var txTile2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[1], r2Max: 0)
        var tyTile2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[1], r2Max: 0)
        var scaleTile2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[1], r2Max: 1)
        var rotationTile2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)

        var txTile3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[2], r2Max: 0)
        var tyTile3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[2], r2Max: 0)
        var scaleTile3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[2], r2Max: 1)
        var rotationTile3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)

        var txTile4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[3], r2Max: 0)
        var tyTile4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[3], r2Max: 0)
        var scaleTile4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[3], r2Max: 1)
        var rotationTile4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)

        var txTile5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[4], r2Max: 0)
        var tyTile5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[4], r2Max: 0)
        var scaleTile5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[4], r2Max: 1)
        var rotationTile5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)

        var txTile6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[5], r2Max: 0)
        var tyTile6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[5], r2Max: 0)
        var scaleTile6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[5], r2Max: 1)
        var rotationTile6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        
        introTile1ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(txTile1), CGFloat(tyTile1))
        introTile1ImageView.transform = CGAffineTransformScale(introTile1ImageView.transform, CGFloat(scaleTile1), CGFloat(scaleTile1))
        introTile1ImageView.transform = CGAffineTransformRotate(introTile1ImageView.transform, CGFloat(Double(rotationTile1) * M_PI / 180))

        introTile2ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(txTile2), CGFloat(tyTile2))
        introTile2ImageView.transform = CGAffineTransformScale(introTile2ImageView.transform, CGFloat(scaleTile2), CGFloat(scaleTile2))
        introTile2ImageView.transform = CGAffineTransformRotate(introTile2ImageView.transform, CGFloat(Double(rotationTile2) * M_PI / 180))

        introTile3ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(txTile3), CGFloat(tyTile3))
        introTile3ImageView.transform = CGAffineTransformScale(introTile3ImageView.transform, CGFloat(scaleTile3), CGFloat(scaleTile3))
        introTile3ImageView.transform = CGAffineTransformRotate(introTile3ImageView.transform, CGFloat(Double(rotationTile3) * M_PI / 180))

        introTile4ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(txTile4), CGFloat(tyTile4))
        introTile4ImageView.transform = CGAffineTransformScale(introTile4ImageView.transform, CGFloat(scaleTile4), CGFloat(scaleTile4))
        introTile4ImageView.transform = CGAffineTransformRotate(introTile4ImageView.transform, CGFloat(Double(rotationTile4) * M_PI / 180))

        introTile5ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(txTile5), CGFloat(tyTile5))
        introTile5ImageView.transform = CGAffineTransformScale(introTile5ImageView.transform, CGFloat(scaleTile5), CGFloat(scaleTile5))
        introTile5ImageView.transform = CGAffineTransformRotate(introTile5ImageView.transform, CGFloat(Double(rotationTile5) * M_PI / 180))

        introTile6ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(txTile6), CGFloat(tyTile6))
        introTile6ImageView.transform = CGAffineTransformScale(introTile5ImageView.transform, CGFloat(scaleTile6), CGFloat(scaleTile6))
        introTile6ImageView.transform = CGAffineTransformRotate(introTile5ImageView.transform, CGFloat(Double(rotationTile6) * M_PI / 180))

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
