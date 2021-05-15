//
// Created by POTCHONA Essosolam Justin on 24/04/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

extension CustomUITextField {

    enum Direction {
        case Left
        case Right
    }
    

// add image to textfield
    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor!,action: UITapGestureRecognizer!){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 45))
        mainView.layer.cornerRadius = 5

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 45))
        view.clipsToBounds = true
        mainView.addSubview(view)

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 12.0, width: 18.0, height: 18.0)
        if action !== nil{
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(action)
        }

        view.addSubview(imageView)

        let seperatorView = UIView()

        if (colorSeparator !== nil){
            seperatorView.backgroundColor = colorSeparator
        }

        mainView.addSubview(seperatorView)

        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 1, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 1, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }


}
