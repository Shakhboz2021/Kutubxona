//
//  BookListService.swift
//  Kutubxona
//
//  Created by Muhammad Tohirov on 09/06/25.
//

import Foundation

class BookListService: BookListDelegate {
    func loadBooks(completion: @escaping ([Book]) -> Void) {
        completion([])
    }
}

class StubBookListService: BookListDelegate {
    let books = [
        Book(
            title: "Urush san'ti",
            author: "Sun Zi",
            description: "A book about war"
        ),
        Book(
            title: "Clean code",
            author: "Robert C. Martin",
            description: "A book about clean code"
        ),
    ]
    func loadBooks(completion: @escaping ([Book]) -> Void) {
        completion(books)
    }

}

class SpyBookListService: BookListDelegate {
    private(set) var fetchBooksCallCount = 0
    func loadBooks(completion: @escaping ([Book]) -> Void) {
        fetchBooksCallCount += 1
        completion([])
    }

}
