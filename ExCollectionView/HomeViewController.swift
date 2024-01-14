//
//  HomeViewController.swift
//  ExCollectionView
//
//  Created by RLogixxTraining on 25/08/23.
//

import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var empDic = [[String:Any]]()
    var img = [Int]()
    var imagestr: String = ""
    var tag = 0
    
    
    @IBOutlet weak var imgEmp: UIImageView!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtBranch: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
         
//        let dict = ["name" : txtName.text ?? "" , "age" : txtAge.text ?? "", "year" : txtYear.text ?? "" , "branch" : txtBranch.text ?? "" , "image" : imagestr,
//        ]
        tag = sender.tag
        if tag == 0 {
            let dict = ["name" : txtName.text ?? "" , "age" : txtAge.text ?? "", "year" : txtYear.text ?? "" , "branch" : txtBranch.text ?? "" , "image" : imagestr, "gender" : "married"
            ]
            empDic.append(dict)
        }else{
            let dict = ["name" : txtName.text ?? "" , "age" : txtAge.text ?? "", "year" : txtYear.text ?? "" , "branch" : txtBranch.text ?? "" , "image" : imagestr,
                        "gender" : "child"]
            empDic.append(dict)
            
        }
       // empDic.append(dict)
        // print(empDic)
    }
    
    @IBAction func btnMale(_ sender: UIButton) {
//        tag = sender.tag
//        if tag == 0 {
//
//                   print("Button tag \(tag) added to dictionary.")
//        }else{
//            print("Button tag\(tag) added to dictionary")
//        }
    }
    
    
    
   
    @IBAction func btnShow(_ sender: Any) {
        
        let sc = self.storyboard?.instantiateViewController(withIdentifier: "table") as! ViewController
        sc.arr = empDic
        self.navigationController?.pushViewController(sc, animated: true)
        
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        
        let alert = UIAlertController(title: "Options ", message: nil, preferredStyle: .actionSheet)
               
               alert.addAction(UIAlertAction(title: "Gallery", style:.default,handler: { _ in  self.openGallery()
                   
               }))
               
               alert.addAction(UIAlertAction(title: "Cancel", style:.default,handler: nil ))
               self.present(alert, animated:  true ,completion:  nil)

    }
    @IBAction func btnReset(_ sender: Any) {
        
        txtAge.text = ""
        txtYear.text = ""
        txtBranch.text = ""
        txtName.text = ""
        
    }
    func openGallery()
       {
           if UIImagePickerController.isSourceTypeAvailable( UIImagePickerController.SourceType.photoLibrary){
               let imagepicker = UIImagePickerController()
               imagepicker.delegate = self
               imagepicker.sourceType = UIImagePickerController.SourceType.photoLibrary
               imagepicker.allowsEditing = false
               self.present(imagepicker , animated: true ,completion: nil)
               
           }
           else
           {
               let alert = UIAlertController(title: "Warning", message: " not to Gallery ", preferredStyle: .alert )
               alert.addAction(UIAlertAction(title: "ok",style: .default, handler: nil))
               self.present(alert , animated: true ,completion: nil)
           }
       }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[.originalImage] as? UIImage{
               imgEmp.image = pickedImage
               // print(convertImageToBase64String(img: pickedImage))
               
                imagestr = convertImageToBase64String(img: pickedImage)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    func convertImageToBase64String(img: UIImage) -> String {
            var strImage =  img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
            return  strImage
        }

}
