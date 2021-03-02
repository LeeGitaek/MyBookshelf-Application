//
//  DetailBook.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/26.
//

import UIKit

public struct DetailBook:Decodable {
    var DetailAuthors:String?
    var DetailPublisher:String?
    var DetailLanguage:String?
    var DetailPage:String?
    var DetailYear:String?
    var DetailRate:String?
    var DetailDesc:String?
    
    private enum CodingKeys:String,CodingKey {
        case DetailAuthors = "authors"
        case DetailPublisher = "publisher"
        case DetailLanguage = "language"
        case DetailPage = "pages"
        case DetailYear = "year"
        case DetailRate = "rating"
        case DetailDesc = "desc"
    }
}

//MARK:- API INFORMATION
/* https://api.itbook.store/1.0/books/{isbn13} */
/*
 {
     "error": "0",
     "title": "A Swift Kickstart, 2nd Edition",
     "subtitle": "Introducing the Swift Programming Language",
     "authors": "Daniel H Steinberg",
     "publisher": "The Pragmatic Programmers",
     "language": "English",
     "isbn10": "0983066981",
     "isbn13": "9780983066989",
     "pages": "414",
     "year": "2017",
     "rating": "0",
     "desc": "This is the perfect book for the experienced developer who wants to get serious about learning the Swift programming language. If you know at least one modern programming language, this book will teach you how to think and program in Swift. Swift's design is inspired by elements from object-oriented...",
     "price": "$29.99",
     "image": "https://itbook.store/img/books/9780983066989.png",
     "url": "https://itbook.store/books/9780983066989"
 }
 */
