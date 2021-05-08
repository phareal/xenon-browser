//
// Created by POTCHONA Essosolam Justin on 08/05/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

class BrowserPaginateCard: UIView {

    //create the label
    //design the card
    //ok
    var indexLabel: UILabel!


    required init(index: NSInteger) {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0x202121)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 6
        width(constant: 33)
        height(constant: 33)
       // centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
        //create the card
        createTheCard(browserIndex: index)

    }

    func createTheCard(browserIndex: NSInteger) {
        self.indexLabel = UILabel()
        self.indexLabel.text = "\(browserIndex)"
        self.indexLabel.textColor = .white
        self.indexLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.indexLabel)

        self.indexLabel.font =  UIFont(name: "Poppins-Bold", size: 20)
         self.indexLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
         self.indexLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}