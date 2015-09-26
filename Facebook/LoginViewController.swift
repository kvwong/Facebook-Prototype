//
//  LoginViewController.swift
//  Facebook
//
//  Created by Kevin Wong on 9/24/15.
//  Copyright © 2015 Kevin Wong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var TextFieldHolder: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var FacebookLogo: UIImageView!
    @IBOutlet weak var loggingInButton: UIImageView!
    @IBOutlet weak var loginSpinner: UIActivityIndicatorView!

    var initialY: CGFloat!
    var initialButtonY: CGFloat!
    var initialFacebookY: CGFloat!
    var initialSpinnerY: CGFloat!
    let offset: CGFloat = -50
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialY = TextFieldHolder.frame.origin.y
        initialButtonY = LoginButton.frame.origin.y
        initialFacebookY = FacebookLogo.frame.origin.y
        initialSpinnerY = loginSpinner.frame.origin.y
        loggingInButton.alpha = 0
        loginSpinner.alpha = 0
        TextFieldHolder.layer.cornerRadius = 4.0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func usernameEdit(sender: AnyObject) {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            LoginButton.enabled = false
        }
        else {
            LoginButton.enabled = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        loggingInButton.alpha = 1
        LoginButton.alpha = 0
        loginSpinner.alpha = 1
        loginSpinner.startAnimating()
        delay(2) {
            self.performSegueWithIdentifier("initializeFeed", sender: self)
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        let kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.FacebookLogo.frame.origin = CGPoint(x: self.FacebookLogo.frame.origin.x, y: self.initialFacebookY + self.offset)
            self.TextFieldHolder.frame.origin = CGPoint(x: self.TextFieldHolder.frame.origin.x, y: self.initialY + self.offset)
            self.LoginButton.frame.origin = CGPoint(x: self.LoginButton.frame.origin.x, y: self.initialButtonY + self.offset)
            self.loggingInButton.frame.origin = CGPoint(x: self.loggingInButton.frame.origin.x, y: self.initialButtonY + self.offset)
            self.loginSpinner.frame.origin = CGPoint(x: self.loginSpinner.frame.origin.x, y: self.initialSpinnerY + self.offset)
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        let kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.FacebookLogo.frame.origin = CGPoint(x: self.FacebookLogo.frame.origin.x, y: self.initialFacebookY)
            self.TextFieldHolder.frame.origin = CGPoint(x: self.TextFieldHolder.frame.origin.x, y: self.initialY)
            self.LoginButton.frame.origin = CGPoint(x: self.LoginButton.frame.origin.x, y: self.initialButtonY)
            self.loggingInButton.frame.origin = CGPoint(x: self.loggingInButton.frame.origin.x, y: self.initialButtonY)
            self.loginSpinner.frame.origin = CGPoint(x: self.loginSpinner.frame.origin.x, y: self.initialSpinnerY)
        }, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
