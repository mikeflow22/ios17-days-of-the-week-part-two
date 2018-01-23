//
//  DayListTableViewController.swift
//  i0s days of the week two
//
//  Created by Michael Flowers on 1/23/18.
//  Copyright © 2018 Michael Flowers. All rights reserved.
//

import UIKit

class DayListTableViewController: UITableViewController {
    
    var daysOfTheWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return daysOfTheWeek.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        let day = daysOfTheWeek[indexPath.row]
        let index = indexPath.row 
        // Configure the cell...
        cell.textLabel?.text = day
        cell.detailTextLabel?.text = "\(index)"
        
        return cell
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //identifier
        if segue.identifier == "toDayDetail" {
            //destination
            guard  let dayDetailVC = segue.destination as? DayDetailViewController else {return}
            //indvidual cell
            guard let selectedDay = tableView.indexPathForSelectedRow else {return}
            //data
            let day = daysOfTheWeek[selectedDay.row]
            //pass information through mailbox variable
            dayDetailVC.day = day
        }
    }

}
