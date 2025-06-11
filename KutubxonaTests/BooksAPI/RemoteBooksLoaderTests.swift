//
//  RemoteBooksLoaderTests.swift
//  KutubxonaTests
//
//  Created by Muhammad Tohirov on 11/06/25.
//

import XCTest

class RemoteBooksLoader {

}

class HTTPClient {
    var requestURL: URL?
}

final class RemoteBooksLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let loader = RemoteBooksLoader()

        XCTAssertNil(client.requestURL)
    }
}
