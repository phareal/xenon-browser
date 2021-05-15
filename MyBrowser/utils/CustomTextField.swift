//
// Created by POTCHONA Essosolam Justin on 08/05/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import  UIKit
class CustomUITextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 40)
   

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
