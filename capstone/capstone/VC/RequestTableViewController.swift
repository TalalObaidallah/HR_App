//
//  RequestTableViewController.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 12/12/2021.
//

import UIKit
// class of request table view controller :-
class RequestTableViewController: UITableViewController {

    @IBOutlet var nameRequest: UITableView!
    
    
    // all requests tableview in app :-
    let sectionRequest = ["Vacation type".localize,"Personal type".localize]
    
    let request1 = RequestName(name: "Annual Leave".localize)
    let request2 = RequestName(name: "Emergency Leave".localize)
    let request3 = RequestName(name: "Sick Leave".localize)
    let request4 = RequestName(name: "Salary Statement Letter".localize)
    let request5 = RequestName(name: "Annual bonus".localize)
    let request6 = RequestName(name: "Medical insurance".localize)
    let request7 = RequestName(name: "Experience certificate".localize)
    let request8 = RequestName(name: "Pragnet leave".localize)
    let request9 = RequestName(name: "Ticket".localize)
    let request10 = RequestName(name: "Marriage leave".localize)
    
    var type : [[RequestName]] = [[],[],[],[],[]]
    
    var selectedRequest: RequestName? = nil
    var titleRequestSender = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // append of requests in each section :-
        nameRequest.delegate = self
        nameRequest.dataSource = self
        
        type[0].append(request1)
        type[0].append(request2)
        type[0].append(request3)
        type[1].append(request4)
        type[1].append(request5)
        type[1].append(request6)
        type[1].append(request7)
        type[0].append(request8)
        type[1].append(request9)
        type[0].append(request10)

    }

    // MARK: - Table view data source
// function of all request section :-
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionRequest.count
    }
    // function of title for header in section :-
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionRequest[section]
    }
    
// function of number of rows in section :-
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return type[section].count
    }
    // function of cell for row at
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! HomeTableViewCell
        cell.nameProfile.text =
        type[indexPath.section][indexPath.row].name
        
        return cell
    }
    
    // function of did select row at :-
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRequest =  type[indexPath.section][indexPath.row]
        // perform segue
        performSegue(withIdentifier: "detailsRequest", sender: nil)
    }
    
    
    // function prepare for segue :-
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsRequest" {
            
            let vc = segue.destination as? RequestDetails
            vc?.order = selectedRequest
            
        }
    }
  
}

// extension of localization transfer for language :-
extension String {
    var localize : String {
        return NSLocalizedString(self, comment: "")
    }
}
