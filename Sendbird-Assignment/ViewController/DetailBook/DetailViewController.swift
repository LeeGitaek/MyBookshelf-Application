//
//  DetailViewController.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/25.
//

import UIKit


class DetailViewController: UIViewController {
    
    //MARK:- UI
    let detailTitle = UILabel()
    let detailSubTitle = UILabel()
    let detailAuthors = UILabel()
    let detailPublisher = UILabel()
    let detailLanguage = UILabel()
    let detailIsbn = UILabel()
    let detailPage = UILabel()
    let detailYear = UILabel()
    let detailRate = UILabel()
    let detailDesc = UITextView()
    let detailPrice = UILabel()
    let detailImage = UIImageView()
    let detailURL = UITextView()
    let alert = UIAlertController(title: "에러", message: "세부정보 데이터 에러", preferredStyle: .alert)

    //MARK:- View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    func MakeConfigure(selectData:Book){
        self.detailIsbn.text = "ISBN: \(selectData.IsbnNumber!)"
        DispatchQueue.global().async {
            Parser.shared.DetailDataApiHandler(isbnData: selectData.IsbnNumber!, completionHandler: { [weak self] (book,err) in
                
                DispatchQueue.main.async {
                    self?.detailPage.text = "Page : \(book!.DetailPage!)"
                    self?.detailYear.text = "Year : \(book!.DetailYear!)"
                    self?.detailRate.text = "Rate : \(book!.DetailRate!)"
                    self?.detailLanguage.text = "Language : \(book!.DetailLanguage!)"
                    self?.detailDesc.text = "Description : \(book!.DetailDesc!)"
                    self?.detailAuthors.text = "Author : \(book!.DetailAuthors!)"
                    self?.detailPublisher.text = "Publisher : \(book!.DetailPublisher!)"
                }
                
                if err != nil {
                    let action = UIAlertAction(title: "ok", style: .default, handler: { [weak self] _ in
                        guard (self?.alert) != nil else {
                            return
                        }
                    })

                    self?.alert.addAction(action)
                    self?.present(self!.alert, animated: true, completion: nil)
                }
                        
            })
        }
      
        self.detailTitle.text = selectData.Title!
        self.detailSubTitle.text = selectData.SubTitle!
        self.detailURL.text = selectData.BookUrl!
        self.detailPrice.text = selectData.Price!
        self.detailImage.loadImageWithURL(URL(string:selectData.BookImage!)!)
    }
    
    func makeUI(){

        /* Navigationbar and View UI Implementation code */
        self.view.backgroundColor = .white
        self.title = "Detail View"
        
        
        /* UIImageView Implementation code */
        self.detailImage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(detailImage)
        
        if #available(iOS 11.0, *) {
            self.detailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.detailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.detailImage.widthAnchor.constraint(equalToConstant:150).isActive = true
            self.detailImage.heightAnchor.constraint(equalToConstant:200).isActive = true
        } 
        
        /* UILabel Implementation code */
        // title , subtitle,authors, publisher , language, isbn13, page, year, rating , desc, price , image ,url
        let labels:[UILabel] = [self.detailTitle,self.detailSubTitle,self.detailPrice,self.detailAuthors,self.detailPublisher,self.detailLanguage,
                                self.detailIsbn,self.detailPage,self.detailYear,self.detailRate]
        var ypos:Int = 200
        
        for (ind,lbl) in labels.enumerated() {
            lbl.reuseLabel()
            if ind == 0 {
                lbl.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
            } 
            self.view.addSubview(lbl)
            if #available(iOS 11.0, *) {
                lbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(ypos)).isActive = true
                lbl.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25.0).isActive = true
                lbl.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 5.0).isActive = true
                lbl.widthAnchor.constraint(equalToConstant:350).isActive = true
                lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
               
                ypos += 25
               
            }
        }
        
        let textviewArr:[UITextView] = [self.detailURL,self.detailDesc]
        
  
        for (ind,txt) in textviewArr.enumerated() {
            txt.isEditable = false
            txt.translatesAutoresizingMaskIntoConstraints = false
            if ind == 0 {
                txt.dataDetectorTypes = .link
                txt.isScrollEnabled = false 
            }
            self.view.addSubview(txt)
            if #available(iOS 11.0, *) {
                if ind == 0 {
                    txt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:450).isActive = true
                    
                } else if ind == 1 {
                    txt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:475).isActive = true
                }
                txt.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 22.0).isActive = true
                txt.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant:-10.0).isActive = true
                txt.widthAnchor.constraint(equalToConstant:350).isActive = true
                
                if ind == 0{
                    txt.heightAnchor.constraint(equalToConstant: 20).isActive = true
                } else if ind == 1 {
                   
                    txt.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-20).isActive = true
                }
                
          
            }
            
        }
        
       
        
       
        
        
    }
    
    
}

//MARK:- Extension
extension UILabel {
    func reuseLabel(){
        self.backgroundColor = .white
        self.textAlignment = .left
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14.0)
        self.textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
