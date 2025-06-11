//
//  BooksLoader.swift
//  Kutubxona
//
//  Created by Muhammad Tohirov on 11/06/25.
//

import Foundation

/*
 Layer1: Domain
 Layer2: Data
 Layer3: Presentation
 */

public protocol BooksLoader {
    func loadBooks(completion: @escaping (Result<[Book], Error>) -> Void)
}
