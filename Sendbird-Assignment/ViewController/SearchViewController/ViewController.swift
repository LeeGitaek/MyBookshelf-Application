//
//  ViewController.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/25.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {
    
    //MARK:- UI
    let searchQuery = UITextField()
    let tableView = UITableView()
    let noDataLabel = UILabel()
    let alert = UIAlertController(title: "에러", message: "데이터 불러오는데 에러 발생", preferredStyle: .alert)
 

    var action = UIAlertAction(title: "ok", style: .default, handler: nil)
    //MARK:-Variables
    var nextCounter:Int = 1
    
    //MARK:- View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
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
        self.searchQuery.delegate = self
       
        self.view.addSubview(searchQuery)
        
        self.searchQuery.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)),for: .editingChanged)
        /* Tableview UI Implementation code  */
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        /* Autolayout Implementation code  */
        if #available(iOS 11.0, *) {
            
            self.searchQuery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 12).isActive = true
            self.searchQuery.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            self.searchQuery.widthAnchor.constraint(equalToConstant:330).isActive = true
            self.searchQuery.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            self.tableView.topAnchor.constraint(equalTo: self.searchQuery.bottomAnchor,constant: 10).isActive = true
            self.tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            self.tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            self.tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
        }
        
        self.action = UIAlertAction(title: "ok", style: .default, handler: { [weak self] _ in
            guard (self?.alert) != nil else {
                return
            }
        })
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
          self.nextCounter = 1
          Parser.shared.bookShelf.removeAll()
            DispatchQueue.main.async {
                  Parser.shared.ReadableBookStoreApiHandler(QueryStr: self.searchQuery.text!, Page: self.nextCounter, completionHandler: { [weak self] (isSucess,err) in
                            if err != nil {
                                self?.alert.addAction(self!.action)
                                self?.present(self!.alert, animated: true, completion: nil)
                            }
                  })
            }
                
              Parser.shared.reloadList = { [weak self] ()  in
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
              }
      
    }
    
    private func nextGetData(page:Int){
        
        DispatchQueue.main.async {
            Parser.shared.ReadableBookStoreApiHandler(QueryStr: self.searchQuery.text!, Page: page, completionHandler: { [weak self] (isSucess,err) in
                if err != nil {
                    self?.alert.addAction(self!.action)
                    self?.present(self!.alert, animated: true, completion: nil)
                }
            })
        }
        Parser.shared.reloadList = { [weak self] ()  in
              DispatchQueue.main.async {
                  self?.tableView.reloadData()
              }
        }
    }
}

//MARK:- extension TableView Delegate and Datasource
extension ViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableViewSetup()  {
        self.tableView.register(UINib(nibName: "mainCell", bundle: nil), forCellReuseIdentifier: mainCell.Identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.keyboardDismissMode = .onDrag
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if Parser.shared.bookShelf.count == 0 {
                print("")
                self.noDataLabel.text = "No Data"
                self.noDataLabel.textColor = .darkGray
                self.noDataLabel.textAlignment = NSTextAlignment.center
                self.tableView.backgroundView = noDataLabel

                self.noDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                self.noDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                self.noDataLabel.widthAnchor.constraint(equalToConstant:95).isActive = true
                self.noDataLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        return Parser.shared.bookShelf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: mainCell.Identifier, for: indexPath) as! mainCell

        if indexPath.row == Parser.shared.bookShelf.count-1 {
            self.nextCounter += 1
            self.nextGetData(page:self.nextCounter)
        }
        
        
        if Parser.shared.bookShelf.count != 0{
            let listObj = Parser.shared.bookShelf[indexPath.row]
            cell.configure(elements: listObj)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // move to detail view
        let detailView = DetailViewController()
        detailView.MakeConfigure(selectData: Parser.shared.bookShelf[indexPath.row])
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
