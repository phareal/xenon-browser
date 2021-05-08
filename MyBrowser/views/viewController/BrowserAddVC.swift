//
//  BrowserAddVC.swift
//  MyBrowser
//


import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

protocol BrowserAddProtocol {
    func urlAdded(browserStr:String,urlStr:String)
    func urlChanged(browserNo:Int,urlStr:String)
}

class BrowserAddVC: UIViewController {
    var delegate:BrowserAddProtocol?
    
    @IBOutlet weak var browserNoTF: UITextField!
    @IBOutlet weak var browserUrlTF: UITextField!
    @IBOutlet weak var countHeight: NSLayoutConstraint!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancelButton: UIView!
    @IBOutlet var addView: UIView!
    var isForEdit = false
    var browserNo = 0
    var urlStr = ""
    override func viewWillAppear(_ animated: Bool) {
        
        self.addView.layer.borderColor = UIColor(red:1, green:1, blue:1, alpha: 0.06).cgColor
        self.addView.layer.borderWidth = 2
        self.browserNoTF.layer.borderColor = UIColor(red:1, green:1, blue:1, alpha: 0.03).cgColor
        self.browserNoTF.layer.borderWidth = 2
        self.browserUrlTF.layer.borderColor = UIColor(red:1, green:1, blue:1, alpha: 0.06).cgColor
        self.browserUrlTF.layer.borderWidth = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.browserNoTF.text = "1"
        self.browserUrlTF.text = "https://www.kith.com"//"https://www.kickslounge.com"
        if isForEdit {
            self.browserUrlTF.text = urlStr
            self.countHeight.constant = 0
        }
        self.okButton.applyGradient(colours:
            [UIColor(red: 75/255, green: 224/255, blue: 149/255, alpha: 1),
             UIColor(red: 36/255, green: 186/255, blue: 112/255, alpha: 1)])
        self.okButton.applyGradient(colours:
            [UIColor(red: 255/255, green: 22/255, blue: 78/255, alpha: 1),
             UIColor(red: 214/255, green: 14/255, blue: 50/255, alpha: 1)])
        

    }
    
    @IBAction func cancelPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okPress(_ sender: UIButton) {
        
        dismiss(animated: true) {
            if self.isForEdit{
                self.delegate?.urlChanged(browserNo: self.browserNo, urlStr:self.browserUrlTF.text! )
            }else{
                self.delegate?.urlAdded(browserStr: self.browserNoTF.text!, urlStr: self.browserUrlTF.text!)
            }
        }
    }
}
