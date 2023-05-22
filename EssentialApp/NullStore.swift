//
//  NullStore.swift
//  EssentialApp
//
//  Created by Kai Chi Tsao on 2023/5/22.
//

import Foundation
import EssentialFeed_KaiLearning

class NullStore {}

extension NullStore: FeedStore {
    
    func deleteCachedFeed() throws {}
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws {}
    
    func retrieve() throws -> CachedFeed? { .none }
}

extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}

    func retrieve(dataForURL url: URL) throws -> Data? { .none }
}
