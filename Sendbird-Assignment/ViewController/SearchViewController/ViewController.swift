//
//  ViewController.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/25.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- UI
    let searchQuery = UITextField()
    let tableView = UITableView()
    
    //MARK:- Variables
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    func makeUI(){
        
        /* Navigationbar and View UI Implementation code */
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "Search"
        
        /* Textfield UI Implementation code  */
   
        self.searchQuery.backgroundColor = .white
        self.searchQuery.textAlignment = .left
        self.searchQuery.placeholder = "Search"
        self.searchQuery.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(searchQuery)
        
        if #available(iOS 11.0, *) {
            self.searchQuery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.searchQuery.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            self.searchQuery.widthAnchor.constraint(equalToConstant:330).isActive = true
            self.searchQuery.heightAnchor.constraint(equalToConstant: 50).isActive = true
        } else {
            // Fallback on earlier versions
            
        }
        
        /* Tableview UI Implementation code  */
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        if #available(iOS 11.0, *) {
            self.tableView.topAnchor.constraint(equalTo: self.searchQuery.bottomAnchor).isActive = true
            self.tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            self.tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            self.tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
        } else {
            // Fallback on earlier versions
            
        }

        
    }
    
    //MARK:- TableView Delegate and Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        return cell
    }
    
    
    //MARK:- API function
    
}

