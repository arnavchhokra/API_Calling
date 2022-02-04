//
//  UserDetailViewController.swift
//  apicalls-mylo_final
//
//  Created by Arnav on 03/02/22.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    
    var user: User?{
        didSet{
            updateViews()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews()
    {
        guard isViewLoaded,
         let user = user else {return}
        title = user.name.first.capitalized
        emailLabel.text = user.email
        dobLabel.text = String(user.dob.age)
        phoneLabel.text = user.phone

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
