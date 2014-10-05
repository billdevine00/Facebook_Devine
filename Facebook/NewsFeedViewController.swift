//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var weddingImage1: UIImageView!
    var imageView: UIImageView!
    var imageViewtoSegue: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    override func prepareForSegue(PhotoViewSegue: (UIStoryboardSegue!), sender: AnyObject!) {
        var destinationViewController = PhotoViewSegue.destinationViewController as PhotoViewController
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        destinationViewController.image = self.imageViewtoSegue.image
    }
    
    @IBAction func onImageTap(gestureRecognizer: UITapGestureRecognizer) {

        imageViewtoSegue = gestureRecognizer.view as UIImageView!
        performSegueWithIdentifier("PhotoViewSegue", sender: nil)

        println(imageView)

        
        
    }
    
  
    
}
