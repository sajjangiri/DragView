//
//  view.swift
//  DragViewProject
//
//  Created by Eeposit 01 on 8/10/17.
//  Copyright © 2017 Eeposit 01. All rights reserved.
//

import UIKit

class View: UIView {
    
    var lastLocation = CGPoint(x: 0, y: 0)
    var tapGesture: UITapGestureRecognizer!
    var colorView: UIView!
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    
    
    init(frame: CGRect , colorView: UIView) {
        self.colorView = colorView
        super.init(frame: frame)
        initTapGesture()
        initPangesture()
        initRandomBackgroundColor()
        self.addGestureRecognizer(self.tapGesture)
    }
    
    func initPangesture () {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.detectTap(_:)))
        self.gestureRecognizers = [panGesture]
    }
    
    func initRandomBackgroundColor() {
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        self.colorView.backgroundColor = self.backgroundColor
        animator = UIDynamicAnimator(referenceView: self)
        gravity = UIGravityBehavior(items: [self])
        animator.addBehavior(gravity)
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectTap(_ recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
        
    }
    
    func initTapGesture() {
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
    }
    
    func tapAction(){
        if self.backgroundColor == self.colorView.backgroundColor {
            self.removeFromSuperview()
        }
    }
    
}

extension View {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubview(toFront: self)
        
        //remember last position
        self.lastLocation = self.center
    }
    
}
