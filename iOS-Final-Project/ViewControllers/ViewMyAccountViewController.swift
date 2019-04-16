

import UIKit
import Firebase
import FirebaseUI

class ViewMyAccountViewController: UIViewController {
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    var authUI:FUIAuth?

    @IBOutlet var tfAddress:UITextField!
    @IBOutlet var tfPhone:UITextField!
    
    @IBAction func saveChanges(sender: UIButton){
        var email:String = (Auth.auth().currentUser?.email!)!
        var emailId:String = (Auth.auth().currentUser?.email?.replacingOccurrences(of: ".", with: ","))!
        
        mainDelegate.ref?.child("accounts/\(emailId)")
            .setValue(["email":"\(email)",
                "address":"\(self.tfAddress.text!)",
                "phone-number": "\(self.tfPhone.text!)"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
