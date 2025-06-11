//
//  RemoteBooksLoaderTests.swift
//  KutubxonaTests
//
//  Created by Muhammad Tohirov on 11/06/25.
//

import XCTest

class RemoteBooksLoader {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://a-URL.com")!)
    }
}

class HTTPClient {
    func get(from url: URL) {
        
    }
}

class HTTPClientSpy: HTTPClient {
    var requestURL: URL?
    override func get(from url: URL) {
        self.requestURL = url
    }
}

final class RemoteBooksLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteBooksLoader(client: client)

        XCTAssertNil(client.requestURL)
    }

    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        let loader = RemoteBooksLoader(client: client)

        loader.load()

        XCTAssertNotNil(client.requestURL)
    }
}

