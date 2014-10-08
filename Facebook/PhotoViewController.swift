//
//  PhotoViewController.swift
//  Facebook
//
//  Created by WilliamDevine on 10/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActions: UIImageView!
    
    var viewCenter: CGPoint!

    var image: UIImage!
    var offset: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        imageView.image = self.image
        view.backgroundColor = UIColor(white: 0, alpha: 1)
       
        
        // Do any additional setup after loading the view.
    }

   
    @IBAction func scrollViewDidScroll(scrollview: UIScrollView!) {
        var offset = abs(Float(scrollView.contentOffset.y))
        var alphaOffset = 1 - CGFloat(offset/100)
        self.view.backgroundColor = UIColor(white: 0, alpha: alphaOffset)
        doneButton.alpha = CGFloat(alphaOffset)
        photoActions.alpha = CGFloat(alphaOffset)
        
        }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var offset = abs(Float(scrollView.contentOffset.y))
        println(offset)

        
        if (offset > 100) {
            dismissViewControllerAnimated(true, completion: nil)
            
            // Do fading out of done and action buttons here
    }
    }
    @IBAction func onDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    
}
