//
//  AproveOrReject.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 13/12/2021.
//

import UIKit

// Class of a aprove or reject type uiviewcontroller

class AproveOrReject: UIViewController {

    @IBOutlet weak var requestTable: UITableView!
   
    var requests = [Requests]()
    var selectedReqwest:Requests?
    
    // use data source and delegate ;-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestTable.delegate = self
        requestTable.dataSource = self
        RequestsApi.getRequest { request in
            DispatchQueue.main.async {
                self.requests.append(request)
                self.requestTable.reloadData()
            }
            
        }
     
    }
}
// extension of requests
extension AproveOrReject:UITableViewDelegate,UITableViewDataSource {
    // function  number of rows in section :-
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    // function of cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lastPage = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! OrderTableViewCell
        
        let name1 = requests[indexPath.row].nameRe
        lastPage.orderLabel.text = name1 ?? " "
        
        return lastPage
    }
    // function of did select row at
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedReqwest = requests[indexPath.row]
// perform segue
        performSegue(withIdentifier: "lastpage", sender: nil)
   }
    // function of prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lastpage" {
            let vc2 = segue.destination as? LastRequestViewController
            vc2?.selectedReqwest = selectedReqwest
            
        }
}
    
}
