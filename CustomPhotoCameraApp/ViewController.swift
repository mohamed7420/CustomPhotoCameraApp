//
//  ViewController.swift
//  CustomPhotoCameraApp
//
//  Created by Mohamed on 11/28/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var buttonCapture: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        imagePicker.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
       buttonCapture.layer.cornerRadius = buttonCapture.frame.height / 2
        
    }


    @IBAction func btn_capture(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController :UIImagePickerControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            imageView.image = pickerImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}

