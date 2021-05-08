//
// Created by POTCHONA Essosolam Justin on 26/04/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

protocol PopUpDelegate {
    func handleDismissal()
}

var txtfld_number : UITextField!
var txtfld_url : UITextField!
var btn_cancel: UIButton!
var btn_save: UIButton!

class AddLinkPopupWindow: UIView {
    var delegate: PopUpDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        let blurEffect =  UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView (effect: blurEffect)
         effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.frame = frame
        addSubview(effectView)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
}
