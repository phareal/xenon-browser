//
// Created by POTCHONA Essosolam Justin on 25/04/2021.
// Copyright (c) 2021 Dreammore. All rights reserved.
//

import Foundation
import UIKit

class OpenNewBrowserTapGesture: UITapGestureRecognizer {
    var urlIndex = 0
}

protocol ReceivedURLForBrowsing {
    func received(index:Int ,url: String)  //data: string is an example parameter
}


class HomeViewController: UIViewController, ReceivedURLForBrowsing, UITableViewDelegate, UITableViewDataSource {
    

    private var storeBrowserUrl  = [Int: String]()
    func received(index: Int, url: String) {
        if (!url.isEmpty) || (index <= 0) {
            print("index is \(index) : \(url)")
            self.storeBrowserUrl[index] = url
            self.countBrowser.text = String(self.storeBrowserUrl.count);
            self.configureBrowserTableView()
        }
        
    }
    private var myTableView : UITableView!

    var popUpWindow: AddLinkPopupWindow={
        let view = AddLinkPopupWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.layer.borderColor = UIColor(rgb: 0x1C1C1C).cgColor
        view.layer.borderWidth = 2
        view.widthAnchor.constraint(equalToConstant: 341).isActive = true
        view.heightAnchor.constraint(equalToConstant: 181).isActive = true
        return view
    }()
    
    var countBrowser : UILabel!;
    var topBlurView : UIVisualEffectView!
    
    
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let vibrancyEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    var centerContent : UIStackView!;
    lazy var container:UIScrollView={
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.contentSize.height=UIScreen.main.bounds.height
        
        return view
    }()
    
    
    private var topBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(rgb: 0x070707)
        
        view.addSubview(container)
        self.container.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        self.container.leftAnchor.constraint(equalTo:view.leftAnchor).isActive=true
        self.container.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        
        setUpNavigationBarItems()
        setUpBrowserCard()
        setupBody()
        setupAddButton()
        let clearBodyGesture = UITapGestureRecognizer(target: self, action: #selector(self.clearView))
        view.addGestureRecognizer(clearBodyGesture)
        
        
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
        let textView = UILabel(frame:  CGRect(x:0,y: 0 ,width: 50,height: 36))
        textView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        textView.text = "Home"
        textView.textColor = .white
        textView.font =  UIFont(name: "Poppins-Bold", size: 20)
        navigationController?.navigationBar.isTranslucent = false
        //let current date
        
        let currentTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .none, timeStyle: .medium)
        
        homeIconView.contentMode = .scaleAspectFit
        
        
        let roundedView = UIView()
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        roundedView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        roundedView.backgroundColor = UIColor(named: "base_green")
        roundedView.frame = CGRect(x:0,y: 0 ,width: 20,height: 20)
        roundedView.layer.cornerRadius = 10
        let showTopPopupRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.showTopPopup))
        roundedView.addGestureRecognizer(showTopPopupRecognizer)
        
        self.countBrowser =  UILabel(frame:  CGRect(x:0,y: 0 ,width: 0,height: 0))
        roundedView.addSubview(self.countBrowser)
        self.countBrowser.text = String(0);
        self.countBrowser.translatesAutoresizingMaskIntoConstraints = false;
        self.countBrowser.textColor = .white
        self.countBrowser.center = roundedView.center
        self.countBrowser.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor).isActive = true
        self.countBrowser.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor).isActive = true
        
        self.countBrowser.font = UIFont(name: "Poppins-Bold", size: 14)

        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: homeIconView),
            UIBarButtonItem(customView: textView),
            UIBarButtonItem(customView: roundedView)
        ]
        
        // rightBarButtonItem
        
        let txt_currentHour = UILabel(frame:  CGRect(x:0,y: 0 ,width: 90,height: 36))
        txt_currentHour.backgroundColor = UIColor(white: 0, alpha: 0.5)
        Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { timer in
            txt_currentHour.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .none, timeStyle: .medium)
        }
      
        txt_currentHour.textColor = UIColor(rgb: 0x474747)
        txt_currentHour.font =  UIFont(name: "Poppins-Bold", size: 14)
        navigationItem.rightBarButtonItem =   UIBarButtonItem(customView: txt_currentHour)
        
    }
    
    
    func  setupBody() {
        setBodyStackView()
    }
    func setUpBodyNoUrlPresent(){
        let txt_topLabel = UILabel()
        txt_topLabel.text  = "Click on the "
        txt_topLabel.textColor = UIColor(named: "base_green")
        txt_topLabel.textAlignment = .center
        txt_topLabel.font = UIFont(name: "Poppins-Bold", size: 20)
        txt_topLabel.setLineSpacing(lineSpacing: 23)
        
        
        //
        
        let img_center = UIImageView(image: UIImage(named: "ic_plus")?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30)))
        let openModalGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.openAddNewBrowserModal))
        img_center.addGestureRecognizer(openModalGestureRecognizer)
        img_center.isUserInteractionEnabled = true
        let txt_bottomLabel = UILabel()
        txt_bottomLabel.text  = "to add your browser"
        txt_bottomLabel.textColor = UIColor(named: "base_green")
        txt_bottomLabel.textAlignment = .center
        txt_bottomLabel.font = UIFont(name: "Poppins-Bold", size: 20)
        txt_bottomLabel.setLineSpacing(lineSpacing: 23)
        
        let centerContainer   = UIStackView()
        self.container.addSubview(centerContainer)
        centerContainer.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        centerContainer.centerYAnchor.constraint(equalTo: self.container.centerYAnchor).isActive = true
        centerContainer.axis  = NSLayoutConstraint.Axis.vertical
        centerContainer.distribution  = UIStackView.Distribution.equalSpacing
        centerContainer.alignment = UIStackView.Alignment.center
        centerContainer.spacing   = 10.0
        
        centerContainer.addArrangedSubview(txt_topLabel)
        centerContainer.addArrangedSubview(img_center)
        centerContainer.addArrangedSubview(txt_bottomLabel)
        centerContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setBodyStackView(){

        if self.storeBrowserUrl.count == 0 {
            setUpBodyNoUrlPresent()
        }else{
            self.configureBrowserTableView()
        }
        
    }
    
    
    
    @objc func showTopPopup(sender:UITapGestureRecognizer){
        self.topBar = UIView();
        self.topBar.tag = 12 // tag of the view
        self.view.addSubview(topBar)
        self.topBar.translatesAutoresizingMaskIntoConstraints = false
        self.topBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.topBar.widthAnchor.constraint(equalToConstant:self.view.frame.width).isActive = true
        setUpTopCard()
    }
    
    
    
    func  setUpTopCard() {
        
        let blurEffect =  UIBlurEffect(style: .dark)
        self.topBlurView = UIVisualEffectView(effect: blurEffect)
        self.topBlurView.translatesAutoresizingMaskIntoConstraints = false
        self.topBlurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.topBlurView.frame.size.width = view.bounds.size.width
        self.topBlurView.frame.size.height = 5
        //setup the vibrancy
        self.topBar.addSubview(topBlurView)
        setUpPagination()
    }
    
    func setUpPagination(){
        var topBlurView = UIView();
        let blurEffect =  UIBlurEffect(style: .dark)
        topBlurView = UIVisualEffectView(effect: blurEffect)
        topBlurView.translatesAutoresizingMaskIntoConstraints = false
        topBlurView.frame = view.bounds

    
        //get the index
        
        let  paginationCardContainer = UIStackView()
        
         paginationCardContainer.translatesAutoresizingMaskIntoConstraints = false

         paginationCardContainer.axis = .horizontal
         paginationCardContainer.alignment = .center
         paginationCardContainer.distribution = .equalCentering
         paginationCardContainer.spacing = 10
         let leftView = UIView();
         leftView.translatesAutoresizingMaskIntoConstraints = false
         leftView.widthAnchor.constraint(equalToConstant: 2).isActive = true
         paginationCardContainer.addArrangedSubview(leftView)
        
        for index in Array(self.storeBrowserUrl.keys).sorted()  {
            let browserCard = BrowserPaginateCard(index: index)
             // add the pagination card
            //add gesture
            let openBrowserGesture = OpenNewBrowserTapGesture.init(target: self, action:#selector(self.openBrowserInFullScreen))
            openBrowserGesture.urlIndex = index
            browserCard.addGestureRecognizer(openBrowserGesture)
            paginationCardContainer.addArrangedSubview(browserCard)
            browserCard.center = paginationCardContainer.center
            browserCard.centerYAnchor.constraint(equalTo: paginationCardContainer.centerYAnchor).isActive = true

        }
        self.topBar.addSubview(paginationCardContainer)
        paginationCardContainer.centerYAnchor.constraint(equalTo: self.topBar.centerYAnchor).isActive = true
    }
    
    
    
    func setUpBrowserCard(){
        let view = UIView()
        //self.container.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 341).isActive = true
        view.heightAnchor.constraint(equalToConstant: 181).isActive = true
        view.backgroundColor = .white
    }
    @objc func openAddNewBrowserModal(sender: UITapGestureRecognizer){
        let createNewBrowser =  CreateNewBrowseViewController()
        createNewBrowser.definesPresentationContext = true
        createNewBrowser.modalPresentationStyle = .overCurrentContext
        createNewBrowser.modalTransitionStyle = .crossDissolve
        createNewBrowser.delegate = self
        present(createNewBrowser, animated: true, completion: nil)
        
    }
    
    func configureBrowserTableView(){
        self.myTableView = UITableView()
        self.view.addSubview(self.myTableView);
        self.myTableView.backgroundColor = UIColor(rgb: 0x070707)
        

        self.myTableView.translatesAutoresizingMaskIntoConstraints = false;
        self.myTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        self.myTableView.register(CustomBrowserCell.self, forCellReuseIdentifier: "CustomBrowserCell")
        self.myTableView.separatorColor = UIColor.clear
        self.setTableViewDelegates()
        self.setupAddButton()
    }
    
    func setTableViewDelegates(){
        self.myTableView.allowsSelection = false
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        self.myTableView.rowHeight = 210
    }


    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storeBrowserUrl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CustomBrowserCell") as! CustomBrowserCell;
        return cell;
    }

    func setupAddButton(){
        let paginationCard = UIView()
        self.view.addSubview(paginationCard)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        paginationCard.addSubview(blurEffectView)
        blurEffectView.frame = paginationCard.bounds

        let img_center = UIImageView(image: UIImage(named: "ic_plus_white")?.scalePreservingAspectRatio(targetSize: CGSize(width: 20, height: 20)))
        let openModalGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.openAddNewBrowserModal))
        img_center.addGestureRecognizer(openModalGestureRecognizer)
        img_center.isUserInteractionEnabled = true
        img_center.translatesAutoresizingMaskIntoConstraints = false;
        paginationCard.addSubview(img_center)
        img_center.centerYAnchor.constraint(equalTo: paginationCard.centerYAnchor).isActive = true
        img_center.centerXAnchor.constraint(equalTo: paginationCard.centerXAnchor).isActive = true


        paginationCard.translatesAutoresizingMaskIntoConstraints = false
        paginationCard.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -50).isActive = true
        paginationCard.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        paginationCard.widthAnchor.constraint(equalToConstant: 38).isActive = true
        paginationCard.heightAnchor.constraint(equalToConstant: 38).isActive = true
        paginationCard.layer.cornerRadius = 10
        paginationCard.backgroundColor = UIColor(rgb: 0x202121)
    }

    @objc func openBrowserInFullScreen(recognizer: OpenNewBrowserTapGesture){
        let url = self.storeBrowserUrl[recognizer.urlIndex]
        //create the component
        let vc = MyBrowserVC()
        vc.view.backgroundColor = .white
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }

    @objc func clearView(){
        if let viewWithTag = self.view.viewWithTag(12) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
}
