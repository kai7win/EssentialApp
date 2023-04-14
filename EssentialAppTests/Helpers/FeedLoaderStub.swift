//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Kai Chi Tsao on 2023/4/14.
//

import EssentialFeed_KaiLearning

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result

    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
