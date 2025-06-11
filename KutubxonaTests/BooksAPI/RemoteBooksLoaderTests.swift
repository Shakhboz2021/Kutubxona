//
//  RemoteBooksLoaderTests.swift
//  KutubxonaTests
//
//  Created by Muhammad Tohirov on 11/06/25.
//

import XCTest

class RemoteBooksLoader {
    let url: URL
    let client: HTTPClient
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestURL: URL?
    func get(from url: URL) {
        self.requestURL = url
    }
}

final class RemoteBooksLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-URL.com")!
        let client = HTTPClientSpy()
        _ = RemoteBooksLoader(url: url, client: client)

        XCTAssertNil(client.requestURL)
    }
    // Given -> When -> Then(assertion)
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://given-URL.com")!
        let client = HTTPClientSpy()
        let loader = RemoteBooksLoader(url: url, client: client)

        loader.load()
    }
}
