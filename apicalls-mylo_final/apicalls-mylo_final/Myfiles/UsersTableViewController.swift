//
//  UsersTableViewController.swift
//  apicalls-mylo_final
//
//  Created by Arnav on 03/02/22.
//

import UIKit

class UsersTableViewController: UITableViewController {

    let apiController = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ItemCell")
        
        



        apiController.getUsers { (error) in
            if let error = error{
                print("Error performing datatask \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiController.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = apiController.users[indexPath.row]
        cell.textLabel?.text = user.name.first.capitalized + " " + user.name.last.capitalized
        
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetail"
        {
            guard let userDetailVC = segue.destination as? UserDetailViewController else
            {return}
            guard let indexPath = self.tableView.indexPathForSelectedRow else {return}
            let user = apiController.users[indexPath.row]
            
            userDetailVC.user = user
        }
    }
    
    
}

