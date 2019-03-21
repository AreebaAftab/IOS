//
//  ViewController.swift
//  Saving Data 1
//
//  Created by user147466 on 3/15/19.
//  Copyright © 2019 user147466. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    var people = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        do { let people = try PersistenceService.context.fetch(fetchRequest)
            self.people = people
            self.tableView.reloadData()
        }
        catch{
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onPlusTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Employee", message: nil, preferredStyle: .alert)
        alert.addTextField
            { (textField) in
            textField.placeholder = "FullName"
        }
        alert.addTextField
            { (textField) in
        textField.placeholder = "empID"
        textField.keyboardType = .numberPad
        }
        alert.addTextField
            { (textField) in
                textField.placeholder = "dateOfBirth"
                textField.keyboardType = .numberPad
        }
        
        let action = UIAlertAction(title: "Post", style: .default){ (_) in
            let fullName = alert.textFields!.first!.text!
            let empID = alert.textFields![1].text!
            let dateOfBirth = alert.textFields!.last!.text!
            let person = Person(context: PersistenceService.context)
            person.fullName = fullName
            person.empID = Int16(empID)!
            person.dateOfBirth = Int32(dateOfBirth)!
            
            PersistenceService.saveContext()
            self.people.append(person)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
        
            
        
            
        
    
    
}
extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].fullName
        cell.detailTextLabel?.text = 
            "empID: " +
            String(people[indexPath.row].empID) + " dateOfBirth: " + String(people[indexPath.row].dateOfBirth)
        
        return cell
        
    }
}


