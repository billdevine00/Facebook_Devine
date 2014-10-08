//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var weddingImage1: UIImageView!
    var imageView: UIImageView!
    var imageViewtoSegue: UIImageView!
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize.height = feedImageView.frame.height
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

        var window = UIApplication.sharedApplication().keyWindow
        var frame = window.convertRect(imageViewtoSegue.frame, fromView: scrollView)
        var copyImageView = UIImageView(frame: frame)
        var finalFrame = CGRect(x: 0, y: 44, width: 320, height: 480)
        copyImageView.image = imageViewtoSegue.image
        copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
        

        if (isPresenting) {

            window.addSubview(copyImageView)
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            copyImageView.clipsToBounds = true
           
            
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyImageView.frame = finalFrame

                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    copyImageView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            }
        } else {
            let vc = fromViewController as PhotoViewController
            let nc = toViewController as? NewsFeedViewController
            
            
            var copyImageView = UIImageView(frame: vc.imageView.frame)
//            var finalFrame = nc.imageViewtoSegue.frame
            

            copyImageView.image = vc.imageView.image
            window.addSubview(copyImageView)

            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                copyImageView.frame = frame
                fromViewController.view.alpha = 0
                println(frame)
                
                }) { (finished: Bool) -> Void in
                    copyImageView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
        
        // TODO: animate the transition in Step 3 below
    
    
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


        
        
    }
    
  
    
}
