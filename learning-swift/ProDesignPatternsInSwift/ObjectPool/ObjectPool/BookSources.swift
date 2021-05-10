//
//  BookSeller.swift
//  ObjectPool
//
//  Created by 石塚隆一 on 2017/11/19.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

class BookSeller {

    class func buyBook(author: String, title: String, stockNumber: Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber);
    }

}

class LibraryNetwork {
    class func borrowBook(author: String, title: String, stockNumber: Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber);
    }
    
    class func returnBook(book: Book) {
        
    }
}
