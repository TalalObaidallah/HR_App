//
//  AproveOrReject.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 13/12/2021.
//

import UIKit

class AproveOrReject: UIViewController {

    @IBOutlet weak var requestTable: UITableView!
    

    var requests = [Requests]()
    var selectedReqwest:Requests?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestTable.delegate = self
        requestTable.dataSource = self
        RequestsApi.getRequest { request in
            self.requests.append(request)
            self.requestTable.reloadData()
        }
     
    }
}
extension AproveOrReject:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lastPage = tableView.dequeueReusableCell(withIdentifier:"lastpage", for: indexPath) as! OrderTableViewCell
        let title = requests[indexPath.row].titleRe
        let commint = requests[indexPath.row].commentRe
        lastPage.orderLabel.text = (title ?? " ") + " " + (commint ?? " ")
        
        return lastPage
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedReqwest = requests[indexPath.row]

        performSegue(withIdentifier: "lastpage", sender: nil)
   }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lastpage" {
            
            let vc2 = segue.destination as? LastRequestViewController
            vc2?.selectedReqwest = selectedReqwest
            
        }
}
}
