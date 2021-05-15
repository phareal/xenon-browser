//
//  CustomBrowserCell.swift
//  MyBrowser
//
//  Created by POTCHONA Essosolam Justin on 02/05/2021.
//  Copyright © 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit


class CustomBrowserCell: UITableViewCell {
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
            print("local")
        backgroundColor = .clear
            displayNib();
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    func displayNib(){
        
        
        //let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        let nibContainer = UIView()
        
        
        nibContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nibContainer);
        nibContainer.widthAnchor.constraint(equalToConstant: 350).isActive = true
        nibContainer.heightAnchor.constraint(equalToConstant: 190).isActive = true
        nibContainer.layer.borderColor = UIColor(rgb: 0xFFFFFF).cgColor
        nibContainer.layer.borderWidth = 2
        nibContainer.layer.cornerRadius = 7
        nibContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
       
        
        //single nib view
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "BrowserView", bundle: bundle)
        let browserComponent = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        browserComponent.translatesAutoresizingMaskIntoConstraints = false;
        nibContainer.addSubview(browserComponent)
        browserComponent.topAnchor.constraint(equalTo:nibContainer.topAnchor , constant: 2).isActive = true
       
        browserComponent.bottomAnchor.constraint(equalTo: nibContainer.bottomAnchor,constant: -2).isActive = true
    
        browserComponent.rightAnchor.constraint(equalTo: nibContainer.rightAnchor,constant: -2).isActive = true
         browserComponent.leftAnchor.constraint(equalTo: nibContainer.leftAnchor,constant: 2).isActive = true
        
        
         //add the x
        
        let closeIcon = UIImageView(image: UIImage(named: "ic_cancel")?.scalePreservingAspectRatio(targetSize: CGSize(width: 15, height: 15)))
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        nibContainer.addSubview(closeIcon)
        closeIcon.topAnchor.constraint(equalTo:nibContainer.topAnchor,constant: 10).isActive = true
        closeIcon.rightAnchor.constraint(equalTo:nibContainer.rightAnchor,constant: -20).isActive = true
        
        
        
    }
}
