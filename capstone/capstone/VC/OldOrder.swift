//
//  OldOrder.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 28/12/2021.
//

import UIKit
import Firebase
import FirebaseAuth

// class old order type UITableViewController

class OldOrder: UITableViewController {

    @IBOutlet var oldOrderTable: UITableView!
    

    var oldRequest = [Requests]()
    var selectedOldReqwest:Requests?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oldOrderTable.delegate = self
        oldOrderTable.dataSource = self
        RequestsApi.getRequestForCurrentUser(uid: Auth.auth().currentUser?.uid ?? "" ) { request in
            DispatchQueue.main.async {
                self.oldRequest.append(request)
                self.oldOrderTable.reloadData()
                
            
            }
//
        }
     
    }

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return oldRequest.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "oldOrder", for: indexPath) as! OldOrderTableViewCell

        let subjects = oldRequest[indexPath.row]
        
        cell.oldOrderLabel.text = subjects.titleRe
        
        if subjects.isApproved == 1 {
            cell.oldOrderImage.image = UIImage(named: "green")
        } else if subjects.isApproved == 2 {
            cell.oldOrderImage.image = UIImage(named: "red")
        } else {
            cell.oldOrderImage.isHidden = true
        }
        
        return cell
    }
  
}
