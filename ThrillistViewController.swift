//
//  ThrillistViewController.swift
//  Facebook
//
//  Created by Kevin Wong on 9/17/15.
//  Copyright © 2015 Kevin Wong. All rights reserved.
//

import UIKit

class ThrillistViewController: UIViewController {

    @IBOutlet weak var buttonController: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = imageView.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likeButton(sender: AnyObject) {
        if(buttonController.selected){
            buttonController.selected = false
        } else {
            buttonController.selected = true
        }
    }

    @IBAction func back(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
