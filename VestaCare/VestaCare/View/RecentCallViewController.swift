//
//  RecentCallViewController.swift
//  VestaCare
//
//  Created by aman on 26/04/24.
//

import UIKit

class RecentCallViewController: UIViewController, CallsService {
    @IBOutlet weak var tableView: UITableView!
    
    let callsViewModel = CallsViewModel()
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        callsViewModel.callsServiceDelegate = self
        callsViewModel.fetchData()
    }
}

extension RecentCallViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = callsViewModel.data else {
            return 0
        }
        return data.response.Call.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CallTableViewCell
        
        guard let data = callsViewModel.data else {
            return cell
        }
        
        // processing logic needs to be shifted to view-model class.
        // missign logic for date & missed calls needs to be added once their is more clarity about api.
        if data.response.Call[indexPath.row].Direction == "inbound" {
            cell.mobileNumber.text = data.response.Call[indexPath.row].From
            cell.callStatusText.text = "incoming "
            cell.callStatusImage.image = UIImage(named: "incoming")
        } else {
            cell.mobileNumber.text = data.response.Call[indexPath.row].To
            cell.callStatusText.text = "Outgoing "
            cell.callStatusImage.image = UIImage(named: "outgoing")
        }
        
        cell.callButton.setImage(UIImage(named: "phoneIcon"), for: .normal)
        cell.callButton.imageView?.fillSuperView()
        
        
        let callMinutes = Int(data.response.Call[indexPath.row].Duration)! / 60
        let callSeconds = Int(data.response.Call[indexPath.row].Duration)! % 60
        
        var callDuration = String(callMinutes)
        callDuration = callDuration + "m "
        callDuration = callDuration + String(callSeconds)
        callDuration = callDuration + "s "
        
        cell.callStatusText.text! += callDuration
        return cell
    }
}
