//
// Created by POTCHONA Essosolam Justin on 25/04/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController: UIViewController  {


    var centerContent : UIStackView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(rgb: 0x070707)
        setUpNavigationBarItems()
        setupBody()
    }

    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
       // self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }

    func setUpNavigationBarItems(){
        let homeIconView = UIImageView(image:UIImage(named: "ic_home")?.scalePreservingAspectRatio(targetSize: CGSize(width: 25, height: 25)))
        homeIconView.frame = CGRect(x:0,y: 0 ,width: 16,height: 16)
        let textView = UITextView(frame:  CGRect(x:0,y: 0 ,width: 76,height: 36))
        textView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        textView.text = "Home"
        textView.textColor = .white
        textView.font =  UIFont(name: "Poppins-Bold", size: 20)
        navigationController?.navigationBar.isTranslucent = false
        //let current date

        let currentTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .none, timeStyle: .medium)

        homeIconView.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItems = [
                UIBarButtonItem(customView: homeIconView),
                UIBarButtonItem(customView: textView),
        ]
        // rightBarButtonItem

        let txt_currentHour = UITextView(frame:  CGRect(x:0,y: 0 ,width: 90,height: 36))
        txt_currentHour.backgroundColor = UIColor(white: 0, alpha: 0.5)
        txt_currentHour.text = currentTime
        txt_currentHour.textColor = UIColor(rgb: 0x474747)
        txt_currentHour.font =  UIFont(name: "Poppins-Bold", size: 14)
        navigationItem.rightBarButtonItem =   UIBarButtonItem(customView: txt_currentHour)

    }
    
    
    func  setupBody() {
       self.centerContent = UIStackView()
        view.addSubview(self.centerContent)
       self.centerContent.translatesAutoresizingMaskIntoConstraints = false;
       self.centerContent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
       self.centerContent.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        self.centerContent.axis = NSLayoutConstraint.Axis.vertical
        self.centerContent.distribution = UIStackView.Distribution.equalSpacing
        self.centerContent.alignment = UIStackView.Alignment.center
       // content
       let txt_topContent  =  UITextView();
        txt_topContent.translatesAutoresizingMaskIntoConstraints = false
        txt_topContent.text = "Click on the"
        txt_topContent.textColor = .white
       self.centerContent.addArrangedSubview(txt_topContent)
    }

}
