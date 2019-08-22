//
//  ImagePickerViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/22.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    // 照片成功取得後會觸發這個方法
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func showImagePicker(_ sender: Any) {
        let alert = UIAlertController.init(title: "Pick Photos", message: "From", preferredStyle: .actionSheet)
        
        let fromCamera = UIAlertAction.init(title: "Camera", style: .default) {
            action in
            self.imagePicker.sourceType = .camera
        }
        
        let fromAlbum = UIAlertAction.init(title: "Album", style: .default) {
            action in
            self.imagePicker.sourceType = .photoLibrary
        }
        
        let savedPhotosAlbum = UIAlertAction.init(title: "savedPhotosAlbum", style: .default) {
            action in
            self.imagePicker.sourceType = .savedPhotosAlbum
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(fromCamera)
        alert.addAction(fromAlbum)
        alert.addAction(savedPhotosAlbum)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
