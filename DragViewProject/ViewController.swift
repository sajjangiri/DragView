//
//  ViewController.swift
//  DragViewProject
//
//  Created by Eeposit 01 on 8/10/17.
//  Copyright © 2017 Eeposit 01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let halfSizeOfView = 25.0
    let maxViews = 25
    var insetSize = CGSize(width: 0, height: 0)
    var newView: View!
    
    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.insetSize = self.view.bounds.insetBy(dx: CGFloat(Int(2 * halfSizeOfView)), dy: CGFloat(Int(2 * halfSizeOfView))).size
        addingView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addingView() {
        for _ in 0..<20 {
            let pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.width))))
            let pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.height))))
            
            newView = View(frame: CGRect(x: pointX, y: pointY, width: 50, height: 50), colorView: self.colorView)
            self.view.addSubview(newView)
            self.viewDidLoad()
        }
        
    }
    
}
