//
//  Library.swift
//  ObjectPool
//
//  Created by 石塚隆一 on 2017/10/23.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

import Foundation

final class Library {
//    private var books: [Book] = []
    private let pool: Pool<Book>

    private init(stockLevel: Int) {
//        for count in 1 ... stockLevel {
//            books.append(Book(author: "Dickens, Charles", title: "Hard Time", stock: count))
//        }
//
//        pool = Pool<Book>(items: books)

        var stockId = 1;

        //        self.pool = Pool<Book>(maxItemCount: stockLevel, factory: { () -> Book in
        //            stockId += 1
        //            return BookSeller.buyBook(author: "Dickens, Charles", title: "Hard Time", stockNumber: stockId)
        //        })

        //        pool = Pool<Book>(itemCount: stockLevel,
        //                          peakCount: stockLevel * 2,
        //                          returnCount: stockLevel /  2,
        //                          itemFactory: { () -> Book in
        //                            stockId += 1
        //                            return BookSeller.buyBook(
        //                                author: "Dickens, Charles",
        //                                title: "Hard Time",
        //                                stockNumber: stockId) },
        //                          peakFactory: { () -> Book in
        //                            stockId += 1
        //                            return LibraryNetwork.borrowBook(
        //                                author: "Dickens, Charles",
        //                                title: "Hard Time",
        //                                stockNumber: stockId) },
        //                          reaper: LibraryNetwork.returnBook)
        pool = Pool<Book>(itemCount: stockLevel,
                          itemFactory: { () -> Book in
                            stockId += 1
                            return BookSeller.buyBook(
                                author: "Dickens, Charles",
                                title: "Hard Time",
                                stockNumber: stockId) },
//                           itemAllocator: { _ in return 0 })
                        itemAllocator: { (books) in
                            var selected = 0
                            for index in 1 ..< books.count {
                                if (books[index].checkoutCount < books[selected].checkoutCount) {
                                    selected = index
                                }
                            }
                            return selected})
    }

    private class var singleton: Library {
        struct SingletonWrapper {
            static let singleton = Library(stockLevel: 5)
        }
        return SingletonWrapper.singleton
    }

    class func checkout(reader: String) -> Book? {
        let book = singleton.pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount += 1
        return book;
    }

    class func returnBook(book: Book) {
        book.reader = nil
        singleton.pool.returnToPool(book)
    }

    class func printReport() {
//        for book in singleton.books {
//            print("...Book#\(book.stockNumber)...", terminator: "\n")
//            print("Checked out \(book.checkoutCount) times", terminator: "\n")
//            if (book.reader != nil) {
//                print("Checked out to \(book.reader!)", terminator: "\n")
//            } else {
//                print("In Stock", terminator: "\n")
//            }
//        }

        singleton.pool.processPoolItems { (books) in
            for book in books {
                print("...Book#\(book.stockNumber)...Checked out \(book.checkoutCount) times", terminator: " ");
                if (book.reader != nil) {
                    print("Checked out to \(book.reader!)")
                } else {
                    print("In Stock")
                }
            }
            print("There are \(books.count) books in the pool")
        }
    }
}
