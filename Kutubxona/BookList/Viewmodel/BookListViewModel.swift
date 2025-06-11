//
//  BookListViewModel.swift
//  Kutubxona
//
//  Created by Muhammad Tohirov on 09/06/25.
//

import Foundation

protocol BookListDelegate {
    func loadBooks(completion: @escaping ([Book]) -> Void)
}

class BookListViewModel: BookListDelegate {
    
    let service: BookListDelegate
    
    init(service: BookListDelegate) {
        self.service = service
    }
    
    func loadBooks(completion: @escaping ([Book]) -> Void) {
        service.loadBooks { books in
            completion(books)
        }
    }
}
