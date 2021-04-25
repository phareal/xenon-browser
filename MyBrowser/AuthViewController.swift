//
//  AuthViewController.swift
//  MyBrowser
//
//  Created by POTCHONA Essosolam Justin on 24/04/2021.
//  Copyright © 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

class AuthViewController: UIViewController{


    var txtfld_email : UITextField!;
    var txtfld_password : UITextField!;
    lazy var loginContainer:UIScrollView={
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.contentSize.height=UIScreen.main.bounds.height
        return view
    }()

    var btn_register:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(rgb: 0x202325).cgColor,UIColor(rgb:0x020202).cgColor]
        gradientLayer.locations = [0.29, 0.60, 1]
        view.insetsLayoutMarginsFromSafeArea = false
        view.layer.addSublayer(gradientLayer)
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
        fieldContainer.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 30).isActive=true
        fieldContainer.axis = NSLayoutConstraint.Axis.vertical
        fieldContainer.distribution = UIStackView.Distribution.equalSpacing
        fieldContainer.alignment = UIStackView.Alignment.center
        fieldContainer.spacing = 12


        //let field
        self.txtfld_email = UITextField()
        fieldContainer.addArrangedSubview(self.txtfld_email)
        self.txtfld_email.translatesAutoresizingMaskIntoConstraints = false
        self.txtfld_email.attributedPlaceholder = NSAttributedString(string: "xenon@xenonaio.com",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x3D3D3E)])
        self.txtfld_email.backgroundColor = UIColor(rgb: 0x242527)
        self.txtfld_email.widthAnchor.constraint(equalToConstant: 329).isActive = true
        self.txtfld_email.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.txtfld_email.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        self.txtfld_email.textColor = UIColor(rgb: 0x3C3E40)
        self.txtfld_email.isEnabled = true
        self.txtfld_email.keyboardType = .emailAddress
        let ic_message = UIImage(named: "ic_message")
        self.txtfld_email.withImage(direction: .Left, image: ic_message!, colorSeparator: UIColor(rgb: 0x4C4D4F))


        self.txtfld_email.layer.cornerRadius = 9
        self.txtfld_email.layer.borderWidth = 1.0
        self.txtfld_email.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor

        //password textfield

        self.txtfld_password = UITextField()
        fieldContainer.addArrangedSubview(self.txtfld_password)
        self.txtfld_password.translatesAutoresizingMaskIntoConstraints = false
        self.txtfld_password.attributedPlaceholder = NSAttributedString(string: "xenon@xenonaio.com",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x3D3D3E)])
        self.txtfld_password.backgroundColor = UIColor(rgb: 0x242527)
        self.txtfld_password.widthAnchor.constraint(equalToConstant: 329).isActive = true
        self.txtfld_password.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.txtfld_password.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        self.txtfld_password.textColor = UIColor(rgb: 0x3C3E40)
        self.txtfld_password.isEnabled = true
        self.txtfld_password.keyboardType = .default
        self.txtfld_password.layer.cornerRadius = 9
        self.txtfld_password.layer.borderWidth = 1.0
        self.txtfld_password.layer.borderColor = UIColor(rgb: 0x4C4D4F).cgColor

        let passwordleftIcon = UIImage(named: "ic_lock")
        let ic_toggleVisibility = UIImage(named: "ic_eye")
        self.txtfld_password.withImage(direction: .Left, image: passwordleftIcon!, colorSeparator: UIColor(rgb: 0x4C4D4F))
        self.txtfld_password.withImage(direction: .Right, image: ic_toggleVisibility!,colorSeparator: nil)

        /*for the button*/

        self.btn_register=UIButton()
        self.loginContainer.addSubview(self.btn_register)
        self.btn_register.translatesAutoresizingMaskIntoConstraints = false
        self.btn_register.topAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: 25).isActive=true
        self.btn_register.centerXAnchor.constraint(equalTo: self.loginContainer.centerXAnchor).isActive=true
        self.btn_register.widthAnchor.constraint(equalToConstant: 330).isActive=true
        self.btn_register.heightAnchor.constraint(equalToConstant: 44).isActive=true
        self.btn_register.layer.cornerRadius = 9
        self.btn_register.backgroundColor =  UIColor(rgb: 0x3BD085)
        self.btn_register.setTitle("Sign In", for: .normal )
        self.btn_register.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
    }

   @objc func goToHome(){
       print("dsdsdss")

        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }

}
