//
//  CreateNewBrowserViewController.swift
//  MyBrowser
//
//  Created by POTCHONA Essosolam Justin on 01/05/2021.
//  Copyright © 2021 Dreammore. All rights reserved.
//

import Foundation


import Foundation
import UIKit

class CreateNewBrowseViewController:UIViewController{
    
    var txtfld_number : UITextField!
    var txtfld_url : UITextField!
    var btn_cancel: UIButton!
    var btn_save: UIButton!
    var delegate: ReceivedURLForBrowsing?
    
    
    
    
    var popUpWindow: AddLinkPopupWindow={
        let view = AddLinkPopupWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.layer.borderColor = UIColor(rgb: 0x1C1C1C).cgColor
        view.layer.borderWidth = 2
        view.widthAnchor.constraint(equalToConstant: 311).isActive = true
        view.heightAnchor.constraint(equalToConstant: 161).isActive = true
    
    
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        createTheView()
        
        let closeModal = UITapGestureRecognizer(target: self, action: #selector(self.dismissViewController))
        
        self.view.addGestureRecognizer(closeModal)
        
        
    }
    
    private func createTheView() {
        
        view.addSubview(popUpWindow)
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        
        popUpWindow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
      
        
        //add the content to the view
        
        let popupTitle = UILabel();
        popUpWindow.addSubview(popupTitle)
        
        popupTitle.topAnchor.constraint(equalTo: popUpWindow.topAnchor,constant: 12).isActive = true
        popupTitle.leftAnchor.constraint(equalTo: popUpWindow.leftAnchor,constant: 20).isActive = true
        popupTitle.text = "Enter URL";
        popupTitle.textColor = .white
        popupTitle.translatesAutoresizingMaskIntoConstraints = false
        popupTitle.font =  UIFont(name: "Poppins-Bold", size: 20)
        
        //create the stackview for the form
        
        
        let fieldContainer = UIStackView()
        self.popUpWindow.addSubview(fieldContainer)
        
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        fieldContainer.leftAnchor.constraint(equalTo: popUpWindow.leftAnchor,constant: 20).isActive = true
    
        fieldContainer.rightAnchor.constraint(equalTo: popUpWindow.rightAnchor,constant: -20).isActive = true
    
        fieldContainer.topAnchor.constraint(equalTo: popupTitle.bottomAnchor,constant: 10).isActive=true
    
        fieldContainer.axis = .horizontal
        fieldContainer.alignment = .fill
        fieldContainer.distribution = .fill
        fieldContainer.spacing = 12
        //add the field to the stack
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        
        self.txtfld_number = UITextField()
        fieldContainer.addArrangedSubview(self.txtfld_number)
        self.txtfld_number.translatesAutoresizingMaskIntoConstraints = false
        self.txtfld_number.attributedPlaceholder = NSAttributedString(string: "0",
                                                                      attributes: [
                                                                        NSAttributedString.Key.foregroundColor:UIColor(rgb: 0xA8A8A8),
                                                                        .paragraphStyle: centeredParagraphStyle
                                                                        
        ])
        self.txtfld_number.backgroundColor = UIColor(rgb: 0x242527)
        self.txtfld_number.widthAnchor.constraint(equalToConstant: 48).isActive = true
        self.txtfld_number.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        self.txtfld_number.textColor = UIColor(rgb: 0xA8A8A8)
        self.txtfld_number.textAlignment = .center
        self.txtfld_number.isEnabled = true
        self.txtfld_number.keyboardType = .numberPad
        self.txtfld_number.layer.cornerRadius = 6
        self.txtfld_number.layer.borderWidth = 1.0
        self.txtfld_number.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor
        self.txtfld_number.font =  UIFont(name: "Poppins-SemiBold", size: 12)
        
        // url
        
        self.txtfld_url = UITextField()
        fieldContainer.addArrangedSubview(self.txtfld_url)
        self.txtfld_url.translatesAutoresizingMaskIntoConstraints = false
        self.txtfld_url.attributedPlaceholder = NSAttributedString(string: "www.kith.com",attributes:
            [
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xA8A8A8),
                .paragraphStyle: centeredParagraphStyle
        ])
        self.txtfld_url.backgroundColor = UIColor(rgb: 0x242527)
    
        self.txtfld_url.rightAnchor.constraint(equalTo: popUpWindow.rightAnchor,constant: -20).isActive = true
    
        self.txtfld_url.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.txtfld_url.textAlignment = .center
        
        self.txtfld_url.textColor =  UIColor(rgb: 0xA8A8A8)
        self.txtfld_url.isEnabled = true
        self.txtfld_url.keyboardType = .emailAddress
        self.txtfld_url.layer.cornerRadius = 6
        self.txtfld_url.layer.borderWidth = 1.0
        self.txtfld_url.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor
        self.txtfld_url.contentVerticalAlignment = .center
        self.txtfld_url.font =  UIFont(name: "Poppins-SemiBold", size: 12)
        
        
        let btnStack = UIStackView()
        
        self.popUpWindow.addSubview(btnStack)
        btnStack.translatesAutoresizingMaskIntoConstraints = false;
        btnStack.centerXAnchor.constraint(equalTo:self.popUpWindow.centerXAnchor).isActive = true
        btnStack.leftAnchor.constraint(equalTo:self.popUpWindow.leftAnchor,constant: 20).isActive = true
        
        btnStack.topAnchor.constraint(equalTo: fieldContainer.bottomAnchor,constant: 15).isActive=true
        btnStack.axis = .horizontal
        btnStack.alignment = .center
        btnStack.distribution = .fillEqually
        btnStack.spacing = 12
        
        
        self.btn_cancel=UIButton()
        btnStack.addArrangedSubview(self.btn_cancel)
        self.btn_cancel.translatesAutoresizingMaskIntoConstraints = false
        self.btn_cancel.widthAnchor.constraint(equalToConstant: 120).isActive=true
        self.btn_cancel.heightAnchor.constraint(equalToConstant: 34).isActive=true
        self.btn_cancel.layer.cornerRadius = 9
        
        self.btn_cancel.backgroundColor =  UIColor(rgb: 0xF71549)
        self.btn_cancel.setTitle("Cancel", for: .normal )
        self.btn_cancel.titleLabel?.font =   UIFont(name: "Poppins-SemiBold", size: 14)
        
        self.btn_cancel.addTarget(self, action: #selector(self.dismissViewController), for: .touchUpInside)
        
        
        self.btn_save=UIButton()
        btnStack.addArrangedSubview(self.btn_save)
        self.btn_save.translatesAutoresizingMaskIntoConstraints = false
        self.btn_save.widthAnchor.constraint(equalToConstant: 120).isActive=true
        self.btn_save.heightAnchor.constraint(equalToConstant: 34).isActive=true
        self.btn_save.layer.cornerRadius = 9
        self.btn_save.backgroundColor =  UIColor(rgb: 0x3BD085)
        self.btn_save.setTitle("Create", for: .normal )
        self.btn_save.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 14)
        self.btn_save.addTarget(self, action: #selector(self.createNewBrowserTab), for: .touchUpInside)
        
        
    }
    
    
    
    @objc func dismissViewController(sender:UITapGestureRecognizer){
        // self.presentedViewController?.dismiss(animated: true, completion: nil)
        print("dismiss")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func createNewBrowserTab(){
        if let delegate = self.delegate {
            let index:Int? = Int(self.txtfld_number.text!)
            delegate.received(index: index!, url: self.txtfld_url.text!)
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
