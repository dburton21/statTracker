//
//  UIButton.swift
//  BasketballTracker
//
//  Created by david burton on 5/12/20.
//  Copyright © 2020 Burton inc. All rights reserved.
//

import Foundation
import UIKit


extension UIButton
{
    func mybg(_bg:UIColor){
        let circlePath = UIBezierPath.init(arcCenter: CGPoint(x:self.bounds.size.width / 2, y: self.bounds.size.height/2),
                                           radius: 50.0, startAngle: (CGFloat(M_PI/4)), endAngle: (CGFloat(M_PI)), clockwise: true)
        
        let circleShape = CAShapeLayer()
        circleShape.path = circlePath.cgPath
        self.layer.mask = circleShape
        self.backgroundColor = .red
        
    }
}

