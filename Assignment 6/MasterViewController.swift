//
//  MasterViewController.swift
//  Assignment 6
//
//  Created by ALISHA JOSHI K on 08/02/21.
//

import UIKit

protocol CustomDelegate : class{
    func navToDetailsScreen(selectedGenre : String)
}

class MasterViewController: UITableViewController {
    
    let movieType = ["Action", "Animation", "Horror", "War", "Crime"]
    
    var Delegate : CustomDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieType.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.white
            cell.textLabel?.tintColor = UIColor.black
        }else{
            cell.backgroundColor = UIColor.gray
            cell.textLabel?.tintColor = UIColor.white
        }

        cell.textLabel?.text = movieType[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        let selectedGenre = currentCell.textLabel?.text ?? ""

            print(selectedGenre)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
                vc.genre = selectedGenre
                splitViewController?.showDetailViewController(vc, sender: nil)
        

    }


}
