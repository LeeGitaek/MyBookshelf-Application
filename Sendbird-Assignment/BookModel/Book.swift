//
//  Book.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/25.
//

import Foundation

public struct BookList:Decodable {
    var ErrorInfo:String?
    var TotalCount:String?
    var Page:String?
    var BookItems:[Book]?
    
    private enum CodingKeys:String,CodingKey {
        case ErrorInfo = "error"
        case TotalCount = "total"
        case Page = "page"
        case BookItems = "books"
    }
}


public struct Book:Decodable {
    var Title:String?
    var SubTitle:String?
    var IsbnNumber:String?
    var Price:String?
    var BookImage:String?
    var BookUrl:String?
    
    private enum CodingKeys:String,CodingKey {
        case Title = "title"
        case SubTitle = "subtitle"
        case IsbnNumber = "isbn13"
        case Price = "price"
        case BookImage = "image"
        case BookUrl = "url"
    }
}


//MARK:- API INFORMATION

/* https://api.itbook.store/1.0/search/{query}/{page} */
/*
 
    "error": "0",
     "total": "112",
     "page": "1",
     "books": [
 
            "title": "A Swift Kickstart, 2nd Edition",
            "subtitle": "Introducing the Swift Programming Language",
            "isbn13": "9780983066989",
            "price": "$29.99",
            "image": "https://itbook.store/img/books/9780983066989.png",
            "url": "https://itbook.store/books/9780983066989"
 
            ],
            ....
*/
