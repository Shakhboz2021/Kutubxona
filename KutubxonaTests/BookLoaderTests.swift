//
//  BookLoaderTests.swift
//  KutubxonaTests
//
//  Created by Muhammad Tohirov on 03/06/25.
//

import XCTest
@testable import Kutubxona

final class BookLoaderTests: XCTestCase {
    
    func test_downloadBooks_returnBookList() throws {
        let service = BookListService()
        let viewModel = BookListViewModel(service: service)
        
        let expectation = XCTestExpectation(description: "Book list downloaded successfully")
        
        viewModel.loadBooks { books in
            if XPCArray().isEmpty {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func test_downloadStubbedBooks_returnStubbedBookList() throws {
        let stubService = StubBookListService()
        let viewModel = BookListViewModel(service: stubService)
        
        let expectation = XCTestExpectation(description: "Stubbed book list downloaded successfully")
        
        viewModel.loadBooks { books in
            XCTAssertFalse(books.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_loadBooks_callsLoadBooksOnce() {
        let service = SpyBookListService()
        let viewModel = BookListViewModel(service: service)
        
        let expectation = XCTestExpectation(description: "Book list downloaded successfully")
        
        viewModel.loadBooks { _ in
            XCTAssertEqual(service.fetchBooksCallCount, 1, "load books method should be called once")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
