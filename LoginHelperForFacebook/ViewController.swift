//
//  ViewController.swift
//  LoginHelperForFacebook
//
//  Created by 신규찬 on 2018. 11. 16..
//  Copyright © 2018년 kcs. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, KFBInfoDelegate{

    //-------------------------------------------------------------------------------------------
    // MARK: - IBOutlets
    //-------------------------------------------------------------------------------------------
    @IBOutlet weak var viewFaceBook: UIView!
    
    
    //-------------------------------------------------------------------------------------------
    // MARK: - override method
    //-------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initFB()
    }

    //-------------------------------------------------------------------------------------------
    // MARK: - local method
    //-------------------------------------------------------------------------------------------
    /// Facebook 로그인 설정
    func initFB(){
        let btnFaceBook = KFBLoginButton(frame: CGRect(x: 0, y: 0, width: viewFaceBook.frame.width, height: viewFaceBook.frame.height))
        btnFaceBook.actionSigninButton(fbInfo: self)
        if btnFaceBook.checkRequest(){
            print("[LoginModule] Login")
        }else{
            print("[LoginModule] Log Out")
        }
        viewFaceBook.addSubview(btnFaceBook)
    }
    
    
    /// 페이스북 로그인 후 정보가 전달됩니다.
    ///
    /// - Parameters:
    ///   - connection: 연결 유무
    ///   - result: 고객 정보 리턴
    ///   - error: 에러 메시지
    func kFBInfoCompletionHandler(_ connection: FBSDKGraphRequestConnection?, _ result: Any, _ error: Error?) {
        if (error == nil){
            let dict = result as! [String : AnyObject]
            //print(result!)
            print(dict)
            let facebookEmail = dict["email"] as! String
            let facebookId = dict["id"] as! String
            print("[LoginModule] email = \(facebookEmail)")
            print("[LoginModule] id = \(facebookId)")
            print("[LoginModule] name = \( dict["name"] as! String)")
        }
    }
    
}

