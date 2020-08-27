//
//  Shadow.swift
//  PomacTask
//
//  Created by Khaled Rashed on 8/27/20.
//  Copyright © 2020 Khaled Rashed. All rights reserved.
//

import UIKit


extension UIView {

    func addShadowCornerRedius (cornerRadius: CGFloat) {
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.cornerRadius = cornerRadius

    }



}
