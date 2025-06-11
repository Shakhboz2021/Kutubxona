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
        client.requestURL = URL(string: "https://a-URL.com")
    }
}

class HTTPClient {
    var requestURL: URL?
}

final class RemoteBooksLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let loader = RemoteBooksLoader(client: client)

        XCTAssertNil(client.requestURL)
    }

    func test_load_requestsDataFromURL() {
        let client = HTTPClient()
        let loader = RemoteBooksLoader(client: client)

        loader.load()

        XCTAssertNotNil(client.requestURL)
    }
}

