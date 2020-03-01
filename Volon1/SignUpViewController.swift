//
//  SignUpViewController.swift
//  Volon1
//
//  Created by Bryant Bettencourt on 3/1/20.
//  Copyright © 2020 Bryant Bettencourt. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var first_name : UITextField!
    @IBOutlet weak var last_name : UITextField!
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var password : UITextField!
    @IBOutlet weak var confirm_password : UITextField!
    @IBOutlet weak var nnext: UIButton!
    
    @IBOutlet weak var prof_pic : UIButton!
    @IBOutlet weak var pic : UIImage!
    
    let picker = UIImagePickerController()
    var userStorage: StorageReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
        let storage = Storage.storage().reference(forURL: "gs://volon-cc482.appspot.com/")
        userStorage = storage.child("users")
        nnext.isHidden = true
    }
    
    @IBAction func prof_pic_sel(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.pic = image
            nnext.isHidden = false
        }
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func next_submit(_ sender: Any) {
        guard first_name.text != "", last_name.text != "", email.text != "", password.text != "", confirm_password.text != "" else {return}
        
        if password.text == confirm_password.text{
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if let user = user{
                    let picref = self.userStorage.child("\(user.uid).jpg")
                    let data = UIImage.jpegData(<#T##self: UIImage##UIImage#>)
                    let uploadTask = picref.put(data!, metadata: nil, completion: { (metadata, err) in
                        if err != nil {
                            print(err!.localizedDescription)
                        }
                        
                        imageRef.downloadURL(completion: { (url, er) in
                            if er != nil {
                                print(er!.localizedDescription)
                            }
                            
                            
                            if let url = url {
                                
                                let userInfo: [String : Any] = ["uid" : user.uid,
                                                                "full name" : self.nameField.text!,
                                                                "urlToImage" : url.absoluteString]
                                
                                self.ref.child("users").child(user.uid).setValue(userInfo)
                                
                                
                                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC")
                                
                                self.present(vc, animated: true, completion: nil)
                                
                            }
                            
                        })
                        
                    })                }
                
            }
        } else{
            print("Passwords do not match")
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

}
