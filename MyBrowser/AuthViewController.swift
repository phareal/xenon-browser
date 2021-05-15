//
//  AuthViewController.swift
//  MyBrowser
//
//  Created by POTCHONA Essosolam Justin on 24/04/2021.
//  Copyright © 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {


    var txtfld_email : CustomUITextField!;
    var txtfld_password : CustomUITextField!;
    var ic_toggleVisibility  :UIImage! ;
    var isPasswordVisible  = true

    lazy var loginContainer:UIScrollView={
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.contentSize.height=UIScreen.main.bounds.height
        return view
    }()


    var btn_register:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(self.loginContainer)

        self.loginContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        self.loginContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        self.loginContainer.leftAnchor.constraint(equalTo:view.leftAnchor).isActive=true
        self.loginContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true

        initForm()
    

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }



    func initForm(){

        let topImage = UIImage(named: "icon_xenon")
        let imageView = UIImageView(image:topImage)
        self.loginContainer.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false ;
        imageView.centerXAnchor.constraint(equalTo:self.loginContainer.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.loginContainer.bottomAnchor,constant: 150).isActive=true

        imageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 103).isActive = true

        //stackview
        let fieldContainer = UIStackView()
    
        self.loginContainer.addSubview(fieldContainer)
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        fieldContainer.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 20).isActive=true
        fieldContainer.leftAnchor.constraint(equalTo: self.loginContainer.leftAnchor,constant: 20).isActive = true
        fieldContainer.rightAnchor.constraint(equalTo: self.loginContainer.rightAnchor,constant: 20).isActive = true
        fieldContainer.axis = NSLayoutConstraint.Axis.vertical
        fieldContainer.distribution = UIStackView.Distribution.equalSpacing
        fieldContainer.alignment = UIStackView.Alignment.center
        fieldContainer.spacing = 15


        //let field
        self.txtfld_email = CustomUITextField()
        self.txtfld_email.delegate = self
       
        fieldContainer.addArrangedSubview(self.txtfld_email)
        self.txtfld_email.translatesAutoresizingMaskIntoConstraints = false
        self.txtfld_email.attributedPlaceholder = NSAttributedString(string: "xenon@xenonaio.com",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x3D3D3E)])
        self.txtfld_email.font = UIFont(name: "EuclidCircularB-Regular", size: 16)
        self.txtfld_email.backgroundColor = UIColor(rgb: 0x242527)
        self.txtfld_email.widthAnchor.constraint(equalToConstant: 329).isActive = true
        self.txtfld_email.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.txtfld_email.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        self.txtfld_email.textColor = UIColor(rgb: 0x3C3E40)
        self.txtfld_email.isEnabled = true
        self.txtfld_email.keyboardType = .emailAddress
        let ic_message = UIImage(named: "ic_message")
        self.txtfld_email.withImage(direction: .Left, image: ic_message!, colorSeparator: UIColor(rgb: 0x4C4D4F),action: nil)
        self.txtfld_email.tag = 1


        self.txtfld_email.layer.cornerRadius = 9
        self.txtfld_email.layer.borderWidth = 1.0
        self.txtfld_email.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor
       
        //password textfield

        self.txtfld_password = CustomUITextField()
        self.txtfld_password.font = UIFont(name: "EuclidCircularB-Regular", size: 16)
    
        self.txtfld_password.delegate = self
        self.txtfld_password.tag = 2
        fieldContainer.addArrangedSubview(self.txtfld_password)
        
        self.txtfld_password.translatesAutoresizingMaskIntoConstraints = false
        self.txtfld_password.attributedPlaceholder = NSAttributedString(string: "..................",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x3D3D3E)])
        self.txtfld_password.backgroundColor = UIColor(rgb: 0x242527)
        self.txtfld_password.widthAnchor.constraint(equalToConstant: 329).isActive = true
        self.txtfld_password.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.txtfld_password.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        self.txtfld_password.textColor = .white
        self.txtfld_password.isEnabled = true
        self.txtfld_password.keyboardType = .default
        self.txtfld_password.layer.cornerRadius = 9
        self.txtfld_password.layer.borderWidth = 1.0
        self.txtfld_password.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor

        let passwordleftIcon = UIImage(named: "ic_lock")
        let togglePasswordVisibilityGesture =  UITapGestureRecognizer(target: self, action: #selector(self.togglePassword))
        self.ic_toggleVisibility = UIImage(named: "ic_eye")
        self.txtfld_password.withImage(direction: .Left, image: passwordleftIcon!, colorSeparator: UIColor(rgb: 0x4C4D4F), action: nil)
        self.txtfld_password.withImage(direction: .Right, image: ic_toggleVisibility!,colorSeparator: nil,action: togglePasswordVisibilityGesture)

        /*for the button*/

        self.btn_register=UIButton()
        self.loginContainer.addSubview(self.btn_register)
        self.btn_register.translatesAutoresizingMaskIntoConstraints = false
        self.btn_register.topAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: 25).isActive=true
        self.btn_register.centerXAnchor.constraint(equalTo: self.loginContainer.centerXAnchor).isActive=true
        self.btn_register.leftAnchor.constraint(equalTo: self.loginContainer.leftAnchor,constant: 20).isActive = true
        self.btn_register.rightAnchor.constraint(equalTo: self.loginContainer.rightAnchor,constant: 20).isActive = true
        self.btn_register.widthAnchor.constraint(equalToConstant: 330).isActive=true
        self.btn_register.heightAnchor.constraint(equalToConstant: 44).isActive=true
        self.btn_register.layer.cornerRadius = 9
        self.btn_register.backgroundColor =  UIColor(rgb: 0x3BD085)

        self.btn_register.setTitle("Sign In", for: .normal )
        self.btn_register.titleLabel?.font =   UIFont(name: "EuclidCircularB-Bold", size: 16)
        self.btn_register.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
    }

   @objc func goToHome(){
       print("dsdsdss")

        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)

    }


    @objc func togglePassword(){
        print("dsds")
        if self.isPasswordVisible == true {
            self.isPasswordVisible = false
            self.txtfld_password.isSecureTextEntry = true
        }else{

            self.isPasswordVisible = true
            self.txtfld_password.isSecureTextEntry = false
            self.ic_toggleVisibility  = UIImage(named: "ic_lock")
        }
       print("toggle")

    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.tag == 1 {
            self.txtfld_email.layer.borderColor = UIColor(rgb: 0xFFFFFF).cgColor
            self.txtfld_email.attributedPlaceholder = NSAttributedString(string: "xenon@xenonaio.com",attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xFFFFFF)])
            self.txtfld_email.textColor = .white
            
            let ic_message = UIImage(named: "ic_message_white")
            self.txtfld_email.withImage(direction: .Left, image: ic_message!, colorSeparator: UIColor(rgb: 0xFFFFFF), action: nil)
            self.txtfld_email.tintColor = .white
        
        }else{
            self.txtfld_password.layer.borderColor = UIColor(rgb: 0xFFFFFF).cgColor
            self.txtfld_password.textColor = .white
            self.txtfld_password.tintColor = .white
            self.txtfld_password.attributedPlaceholder = NSAttributedString(string: "..................",attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xFFFFFF)])
            self.txtfld_password.isEnabled = true
            self.txtfld_password.keyboardType = .default
            self.txtfld_password.layer.cornerRadius = 9
            self.txtfld_password.layer.borderWidth = 1.0
            let ic_lock = UIImage(named: "ic_lock_white")
            self.txtfld_password.withImage(direction: .Left, image: ic_lock!, colorSeparator: UIColor(rgb:  0xFFFFFF), action: nil)
          
        }
       
        
     }
    func textFieldDidEndEditing(_ textField: UITextField) {
       // self.shouldDesactivateTextField(textField, textField.tag)
        print("end editing \(textField.tag)")
        
        if textField.tag == 1 {
            self.txtfld_email.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor
            self.txtfld_email.attributedPlaceholder = NSAttributedString(string: "xenon@xenonaio.com",attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x4C4D4F)])
            self.txtfld_email.textColor = UIColor(rgb: 0x4C4D4F)
            
            let ic_message = UIImage(named: "ic_message")
            self.txtfld_email.withImage(direction: .Left, image: ic_message!, colorSeparator: UIColor(rgb: 0x4C4D4F), action: nil)
        }else{
            self.txtfld_password.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor
            self.txtfld_password.isEnabled = true
            self.txtfld_password.keyboardType = .default
            self.txtfld_password.layer.cornerRadius = 9
            self.txtfld_password.layer.borderWidth = 1.0
            self.txtfld_password.attributedPlaceholder = NSAttributedString(string: "..................",attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x4C4D4F)])
            let ic_lock = UIImage(named: "ic_lock")
            self.txtfld_password.withImage(direction: .Left, image: ic_lock!, colorSeparator: UIColor(rgb: 0x4C4D4F), action: nil)
            self.txtfld_password.textColor = UIColor(rgb: 0x4C4D4F)
          
        }
       

     }
    
    
    private func shouldDesactivateTextField(_ textField: UITextField, _ tag: Int){
        if tag != textField.tag {
            print("tag is \(tag)")
            //textField.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor
           
        }else{
            print("tag is \(tag)")
            print("No it is not him ")
        }
    }

}
