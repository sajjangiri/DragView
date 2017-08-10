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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initPangesture()
        initRandomBackgroundColor()
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectTap(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
        
    }
    
}

extension View {
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        
        //remember last position
        self.lastLocation = self.center
    }
    
}