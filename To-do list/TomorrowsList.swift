//
//  TomorrowsList.swift
//  To-do list
//
//  Created by Maya Lee on 9/9/21.
//

import UIKit

class TomorrowsList: UIViewController, UITableViewDelegate {

    //all iboutlets
    @IBOutlet weak var tableView: UITableView!

    var things = [String]() //the string array that stores the list
    
    @IBAction func onAddTapped(_ sender: Any) { //when the button is tapped, the alert will come up and let them add the todo list item
        let alert = UIAlertController(title: "Add list item", message: nil, preferredStyle: UIAlertController.Style.alert) //titles the alert
        alert.addTextField {(thingTF) in
            thingTF.placeholder = "Enter list item" //placeholder where user enters to do list item
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let thing = alert.textFields?.first?.text else {return}
            self.things.append(thing) //puts the entry into the array
            self.tableView.reloadData() //reloads the table so that it updates
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //closes the page
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}

extension TomorrowsList: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let thing = things[indexPath.row]
        cell.textLabel?.text = thing
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        things.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
