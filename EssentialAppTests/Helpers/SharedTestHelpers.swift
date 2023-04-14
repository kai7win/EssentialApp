//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Kai Chi Tsao on 2023/4/14.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
