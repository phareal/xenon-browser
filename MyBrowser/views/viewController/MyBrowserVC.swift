//
//  MyBrowserVC.swift
//  MyBrowser
//

import UIKit
import WebKit
import Foundation


class MyBrowserVC: UIViewController,WKNavigationDelegate,WKScriptMessageHandler,UIScrollViewDelegate {
    @IBOutlet weak var menuScrollBgView: UIView!
    @IBOutlet weak var menuScrollV: UIScrollView!
    @IBOutlet weak var rightMenuV: UIView!
    @IBOutlet weak var menuSV: UIStackView!
    @IBOutlet var sideMenuView: UIView!
    @IBOutlet weak var browserCountLbl: UILabel!
    @IBOutlet weak var hintLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var closeBtn: UIButton!
    let tagNo = 100
    let viewHeight : CGFloat = 250
    let lineSpace : CGFloat = 15
    let appDel = UIApplication.shared.delegate as! AppDelegate
    let shortStates = ["AA", "AE", "AP", "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY","LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PM", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"];
    var states = [String]()
    
    //depending on number of browsers open it shows hint or count of browsers
    var browserArr = [String](){
        didSet{
            print("Browser val change")
            if browserArr.count == 0 {
                hintLbl.isHidden = false
                browserCountLbl.isHidden = true
            }else{
                hintLbl.isHidden = true
                browserCountLbl.isHidden = false
                browserCountLbl.text = "\(browserArr.count)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //reading state list from info.plist
        /*let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        if let dict = NSDictionary(contentsOfFile: path!){
            states = dict.value(forKey: "statelist") as! [String]
        }*/
        
        //self.closeBtn.isHidden = true
        //browserCountLbl.isHidden = true
       // menuScrollV.isUserInteractionEnabled = true
        //hide side menu on tap
        
        //hide side menu on tap
        //let tapGest = UITapGestureRecognizer(target: self, action: #selector(hideSideMenu))
        //rightMenuV.addGestureRecognizer(tapGest)
    }
    
    //left side menu Press
    @IBAction func leftMennuPress(_ sender: Any) {
        showSideMenu()
    }
    
    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    
    // Implement `WKScriptMessageHandler`，handle message which been sent by JavaScript
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //        if(message.name == "callbackHandler") {
        //print("JavaScript is sending a message \(message.body)")
        //        }
    }
    
    //gets call when user adds url
    func urlAdded(browserStr: String, urlStr: String) {
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        
    }
    
    @objc func enlargeBtnPress(sender: UIButton) {

    }
    
    @IBAction func addBtnPress(_ sender: UIButton) {
       
    }
    
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    }
    
    @objc func nxtBtnPress(sender:UIButton){

    }
    
    @objc func prexBtnPress(sender:UIButton){

    }
    
    @objc func homeBtnPress(sender:UIButton){
       
    }
    
    @objc func cloneBtnPress(sender:UIButton){
    }
    
    @objc func refreshBtnPress(sender:UIButton){
   
    }
    
    @objc func closeBtnPress(sender:UIButton){
    }
    
    @objc func browserBtnPress(sender:UIButton){
 
    }
    
    @IBAction func closeAllBrowsersPress(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to close all the browsers?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
    
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func rearrangeViews(){
    }
    
    func bottomBarItemShowHide(browserV:MyBrowserView,toShow:Bool){
 
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
}

class MyBrowserView:UIView{
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    //    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var browserBtn: UIButton!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    var webView = WKWebView()
    @IBOutlet weak var bottomBarView: UIView!
    //    @IBOutlet weak var bottomAlphaView: UIView!
    @IBOutlet weak var bottomAlphaView: UIVisualEffectView!
    @IBOutlet weak var enlargeBtn: UIButton!
    var webEnlarge = false
    var myFrame : CGRect!
    @IBOutlet weak var refreshBtn: UIButton!
    @IBOutlet weak var cloneBtn: UIButton!
    
    override func awakeFromNib() {

    }
}

//populate userdata in html form
extension MyBrowserVC{
    
    func showSideMenu(){

    }
    
    @objc func hideSideMenu(){
    }
    
    
    //this function getting called whenever url gets changed in wkwebview and it executes script
    
}


//Changing browser functionality
extension MyBrowserVC{
    
    
    
    @objc func menuBtnPress(sender:UIButton){
    
    }
    func urlChanged(browserNo:Int,urlStr:String){
        
    }
}


extension UIView {
    func height(constant: CGFloat) {
        setConstraint(value: constant, attribute: .height)
    }
    
    func width(constant: CGFloat) {
        setConstraint(value: constant, attribute: .width)
    }
    
    private func removeConstraint(attribute: NSLayoutConstraint.Attribute) {
        constraints.forEach {
            if $0.firstAttribute == attribute {
                removeConstraint($0)
            }
        }
    }
    
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute) {
        removeConstraint(attribute: attribute)
        let constraint =
            NSLayoutConstraint(item: self,
                               attribute: attribute,
                               relatedBy: NSLayoutConstraint.Relation.equal,
                               toItem: nil,
                               attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                               multiplier: 1,
                               constant: value)
        self.addConstraint(constraint)
    }
}
