import UIKit

class Data: NSObject {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var address: String?
    var age: String?
    var gender: String?
    var birthdate: String?
    var avatar: String?
    
    func initWithData(theRow i:Int, theName n:String, theEmail e:String, thePhone p:String, theAddress ad:String, theAge ag:String, theGender g:String, theBirthDate b:String, theAvatar av:String ){
        
        id = i
        name = n
        email = e
        phone = p
        address = ad
        age = ag
        gender = g
        birthdate = b
        avatar = av
    }
}
