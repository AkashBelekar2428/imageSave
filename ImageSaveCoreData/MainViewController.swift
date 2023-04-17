//
//  MainViewController.swift
//  ImageSaveCoreData
//
//  Created by Akash Belekar on 17/04/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var profileImage = UIImagePickerController()

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.delegate = self
        image1.isUserInteractionEnabled = true
        image1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_ :))))

    }
    @objc func imageTapped(_ sender:UITapGestureRecognizer){
        profileImage.allowsEditing = false
        profileImage.sourceType = .photoLibrary
        
        present(profileImage, animated: true, completion: nil)
    }

    @IBAction func saveBtnClicked(_ sender: UIButton) {
        print("clicked")
//        let jpg = self.image1.image?.jpegData(compressionQuality: 0.75)
//        if let png = self.image1.image?.pngData(){
//            DataBaseHelper.shared.imageSaveInCoreData(at: png)
//        }
//
        let arr = DataBaseHelper.shared.getProfileData()
        self.image2.image = UIImage(data: arr[1].img!)
        
    }
    
}

extension MainViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageTap = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image1.contentMode = .scaleAspectFit
            image1.image = imageTap

        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
