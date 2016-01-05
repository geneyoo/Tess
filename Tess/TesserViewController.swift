//
//  TeserViewController.swift
//  Tess
//
//  Created by Gene Yoo on 1/4/16.
//  Copyright © 2016 gyoo. All rights reserved.
//

import UIKit

class TesserViewController: UIViewController, UINavigationControllerDelegate,
                            UIImagePickerControllerDelegate {

    var imageView: UIImageView!
    var selectImageButton: UIButton!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPickerElements()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPickerElements() {
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let navHeight =
                navigationController?.navigationBar.frame.size.height
        imagePicker = UIImagePickerController()
    
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.blackColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica",
                                                    size: 20.0)!
        ]

        imageView = UIImageView(frame:
            CGRectMake(0.0, navHeight!, screenWidth, screenWidth))
        view.addSubview(imageView)
        // testing
        imageView.backgroundColor = UIColor.blueColor()
        
        selectImageButton = UIButton()
        selectImageButton.frame = CGRectMake(screenWidth / 2.0 - 40.0,
                                             screenWidth + navHeight! + 10.0,
                                             80.0, 30.0)
        selectImageButton.setTitle("Camera Roll",
            forState: UIControlState.Normal)
        
        selectImageButton.titleLabel!.font = UIFont(name: "Helvetica",
                                                    size: 16.0)
        selectImageButton.layer.borderColor = UIColor.blueColor().CGColor
        selectImageButton.layer.borderWidth = 1.0
        selectImageButton.layer.cornerRadius = 5.0;
        selectImageButton.layer.backgroundColor = UIColor.clearColor().CGColor
        
        
        selectImageButton.addTarget(self, action: "didTapSelectImageButton",
            forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(selectImageButton)
    
        // ADD CANCEL/RETURN BUTTON AFTER ADDING MORE VIEWS
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingImage image: UIImage,
        editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        
        })
        imageView.image = image
    }


    func didTapSelectImageButton() {
        imagePicker.delegate = self
        imagePicker.sourceType = .SavedPhotosAlbum
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
}

