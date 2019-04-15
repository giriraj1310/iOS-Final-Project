





import UIKit
import FirebaseUI
import Firebase
import UserNotifications
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate, FUIAuthDelegate{
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var authUI:FUIAuth?
    var forcePlayOnce: Bool = false
    var soundPlayer: AVAudioPlayer?
    @IBOutlet var txtUsername:UITextField!
    @IBOutlet var txtPassword:UITextField!
    @IBOutlet var btnLogin:UIButton!
    @IBOutlet var btnRegister:UIButton!
    
    @IBAction func unwindToIndexVC(sender: UIStoryboardSegue){}
    
    @IBAction func testLogin(sender:UIButton){
        if Auth.auth().currentUser == nil {
            if let authVC = authUI?.authViewController(){
                present(authVC, animated: true, completion: nil)
            }
            
            if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
            }
            
            //            Auth.auth().signIn(withEmail: txtUsername.text, password: txtPassword.text, completion: { (user, error) in
            //                if error == nil {
            //                    self.btnLogin.setTitle("Logout", for: .normal)
            //                }
            //            })
        } else {
            self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
//            do {
//                try Auth.auth().signOut()
//                self.btnLogin.setTitle("Login", for: .normal)
//            } catch {}
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notification()
        initializeControlsInView()
        playSound()
      
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers :[FUIAuthProvider] = [FUIGoogleAuth(), FUIEmailAuth()]
        authUI?.providers = providers
    }
    
    override func viewDidAppear(_ animated: Bool) {
  
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error == nil {
            self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
            btnLogin.setTitle("Logout", for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func playSound(){
        let soundURL = Bundle.main.path(forResource: "windowXPsound", ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        soundPlayer?.currentTime = 0
        soundPlayer?.volume = 50
        soundPlayer?.numberOfLoops = 0
    
        //Temporary auto log off
        //        do {
        //            try Auth.auth().signOut()
        //        } catch {}
    
        //Adding Threads
        //        mainDelegate.ref?.child("threads").childByAutoId()
        //            .setValue(["topic":"Firebase",
        //                       "subject":"How hard is it?",
        //                       "body":"Had to change my tables 100000 times",
        //                       "date":"\(Date())",
        //                       "poster":"chongl"])
    
        if forcePlayOnce == false {
        soundPlayer?.play()
        forcePlayOnce = true
        }
    
    }
    
    func initializeControlsInView(){
        //UITextField Controllers
        txtUsername.layer.cornerRadius = 16
        txtUsername.layer.borderWidth = 1
        txtUsername.layer.borderColor = UIColor.green.cgColor
        txtPassword.layer.cornerRadius = 16
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor.green.cgColor
        
        //UIButton Controllers
        btnLogin.layer.cornerRadius = 16
        btnLogin.layer.borderWidth = 1.0
        btnLogin.layer.borderColor = UIColor.blue.cgColor
        btnRegister.layer.cornerRadius = 16
        btnRegister.layer.borderWidth = 1
        btnRegister.layer.borderColor = UIColor.blue.cgColor
    }
    
    func notification(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in}
        
        let content = UNMutableNotificationContent()
        content.title = "Procrastinating?"
        content.body = "Procrastinate in the app instead"
        
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (Error) in}
    }
}

