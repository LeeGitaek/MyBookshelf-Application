//
//  mainCell.swift
//  Sendbird-Assignment
//
//  Created by gitaeklee on 2021/02/25.
//

import UIKit

class mainCell: UITableViewCell {
    
    static var Identifier:String = "mainCell"

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookSubTitle: UILabel!
    @IBOutlet weak var bookIsbn: UILabel!
    @IBOutlet weak var bookPrice: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(elements:Book){
        bookTitle.text = elements.Title
        bookSubTitle.text = elements.SubTitle
        bookIsbn.text = "ISBN: \(elements.IsbnNumber!)"
        bookPrice.text = elements.Price
        bookImage.loadImageWithURL(URL(string: elements.BookImage!)!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    func loadImageWithURL(_ url: URL) {//}-> URLSessionDownloadTask {
        let session = URLSession.shared
        session.downloadTask(with: url, completionHandler: { [weak self] url, response, error in
            if error == nil, let url = url,
                let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
            }
        }).resume()
        
    }
}
