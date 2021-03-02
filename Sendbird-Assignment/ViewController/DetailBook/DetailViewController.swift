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
    let detailDesc = UILabel()
    let detailPrice = UILabel()
    let detailImage = UIImageView()
    let detailURL = UILabel()
    
    //MARK:- View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    func MakeConfigure(selectData:Book){
        self.detailIsbn.text = "ISBN: \(selectData.IsbnNumber!)"
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
        } else {
            // Fallback on earlier versions
        }
        
        /* UILabel Implementation code */
        // title , subtitle,authors, publisher , language, isbn13, page, year, rating , desc, price , image ,url
        let labels:[UILabel] = [self.detailTitle,self.detailSubTitle,self.detailAuthors,self.detailPublisher,self.detailLanguage,
                                self.detailIsbn,self.detailPage,self.detailYear,self.detailRate,self.detailPrice,self.detailDesc,
                                self.detailURL]
        var ypos:Int = 200
        
        for (ind,lbl) in labels.enumerated() {
            lbl.reuseLabel()
            if ind == 0 {
                lbl.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
            } 
            self.view.addSubview(lbl)
            if #available(iOS 11.0, *) {
                lbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(ypos)).isActive = true
                lbl.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 5.0).isActive = true
                if ind > 9 {
                    lbl.widthAnchor.constraint(equalToConstant:370).isActive = true
                }else {
                    lbl.widthAnchor.constraint(equalToConstant:370).isActive = true
                }
                lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
                ypos += 25
            } else {
                // Fallback on earlier versions
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
