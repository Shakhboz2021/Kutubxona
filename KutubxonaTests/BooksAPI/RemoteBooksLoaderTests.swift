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

final class RemoteBooksLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-URL.com")!
        let (_, client) = makeSUT(url: url)

        XCTAssertTrue(client.requestURLs.isEmpty)
    }

    // Given -> When -> Then(assertion)
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://given-URL.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()
        XCTAssertEqual(client.requestURLs, [url])
    }
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "https://given-URL.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()
        sut.load()
        XCTAssertEqual(client.requestURLs, [url, url])
    }

    // MARK: - Helpers
    private func makeSUT(url: URL = URL(string: "https://a-URL.com")!) -> (
        sut: RemoteBooksLoader, client: HTTPClientSpy
    ) {  // SUT - system under test
        let client = HTTPClientSpy()
        let sut = RemoteBooksLoader(url: url, client: client)
        return (sut, client)
    }
    class HTTPClientSpy: HTTPClient {
        var requestURLs: [URL] = []
        func get(from url: URL) {
            self.requestURLs.append(url)
        }
    }
}
