//
//  Parser.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/25.
//

import Foundation

protocol BookApiProtocolHandler {
    func ReadableBookStoreApiHandler(QueryStr:String,Page:Int)
}

class Parser: BookApiProtocolHandler {
  
    static let shared = Parser()
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    var bookShelf : [Book] = []{
        didSet{
            reloadList()
        }
    }

    private init() {}
    
    //MARK:- Http request api handler
    
    func ReadableBookStoreApiHandler(QueryStr:String,Page:Int){
        
        let bookUrl = "https://api.itbook.store/1.0/search/\(QueryStr)/\(Page)"
        let encoded = bookUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let bookStoreURL = URL(string: encoded!)
        var request = URLRequest(url: bookStoreURL!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            guard let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 else { return }
            do {
                let bookList = try JSONDecoder().decode(BookList.self, from: data)
                self.bookShelf = bookList.BookItems!
            } catch let error{
                self.errorMessage(error.localizedDescription)
            }
        }.resume()
    }
    
    
    
    
}




