//
//  ViewController.swift
//  FBStreamAnimations
//
//  Created by getTrickS2 on 3/25/18.
//  Copyright © 2018 Nik's. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // I can create curve
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        // 1. Line's start
        path.move(to: CGPoint(x: 0, y: 300))
        // 2. Line's description
        let endPoint = CGPoint(x: 400, y: 200)
        let randomYShift = (drand48() * 200) - 100
        let cp1 = CGPoint(x: 100, y: 200 + randomYShift)
        let cp2 = CGPoint(x: 200, y: 400 + randomYShift)
        // Configure path
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        
        return path
    }
    
    @objc func handleTap() {
        for _ in 1...10 {
            generateAnimatedViews()
        }
    }
    
    func generateAnimatedViews() {
        // 1. Create image
        let image = drand48() < 0.5 ? #imageLiteral(resourceName: "thumbs_up") : #imageLiteral(resourceName: "heart")
        let imageView = UIImageView(image: image)
        
        let dimention = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimention, height: dimention)
        // 2. Create animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 1 + drand48()
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        //animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        // 3. Add animation to imageView
        imageView.layer.add(animation, forKey: nil)
        // 4. Add imageView to the view
        view.addSubview(imageView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        
    }

}
































