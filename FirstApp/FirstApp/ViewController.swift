//
//  ViewController.swift
//  FirstApp
//
//  Created by MacMini03 on 09/10/19.
//  Copyright © 2019 MacMini03. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker1.delegate = self
    }
        
    //for image
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var img1: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var imagePicker1 = UIImagePickerController()
    
    //for text
    @IBOutlet weak var messageTextField: UITextField!
    
    
    @IBOutlet weak var textField: UITextField!
  //for share button
    @IBAction func onShareTapped(_ sender: Any) {
    
        let activityController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }

    
    @IBAction func onShareTapped1(_ sender: Any) {

    let activityController = UIActivityViewController(activityItems: [img.image!], applicationActivities: nil)
    present(activityController, animated: true, completion: nil)
}
    

    @IBAction func onShareTapped2(_ sender: Any) {
        
        let activityController = UIActivityViewController(activityItems: [img1.image!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    //for text
    @IBAction func onButtonTapped(_ sender: Any) {
        
        let message = messageTextField.text?.addingPercentEncoding(withAllowedCharacters: . urlQueryAllowed)
    
        
        let application  = UIApplication.shared
  
            let secondAppPath = "second://secretPage?message=\(message ?? "")"
            
            let appUrl = URL (string: secondAppPath)!
            
            let websiteUrl = URL(string: "https:kiloloco.com")!
            
            if application.canOpenURL(appUrl) {
                
                application.open(appUrl, options : [:], completionHandler: nil)
                
                
            }else {
                
                application.open(websiteUrl)
            }
        }
    
    
        
    @IBAction func onClickImage1(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
        let imagePicker1 = UIImagePickerController()
        imagePicker1.delegate = self
        imagePicker1.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker1.allowsEditing = false
            self.present(imagePicker1 , animated: true , completion: nil)
        }
        
    }
    
    /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
      if  let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            img1.contentMode = .scaleToFill
            img1.image = pickedImage
        }
        picker.dismiss(animated: true , completion: nil)
    }
 */
    
    @IBAction func onClickImage(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
        
    }
}

extension ViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        if let image = info[UIImagePickerControllerEditedImage] as?  UIImage{
            
            img.image = image
            
            }
        picker.dismiss(animated: true , completion: nil)
    

    if  let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
        img1.contentMode = .scaleToFill
        img1.image = pickedImage
    }
    picker.dismiss(animated: true , completion: nil)
}
}


