//
//  FeedLoaderWithFallbackCompositeTests.swift
//  EssentialAppTests
//
//  Created by Kai Chi Tsao on 2023/4/13.
//

import XCTest
import EssentialFeed_KaiLearning


class FeedLoaderWithFallbackComposite:FeedLoader{
    
    private let primary:FeedLoader
    
    init(primary:FeedLoader,fallback:FeedLoader){
        self.primary = primary
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        primary.load(completion: completion)
    }
}


class FeedLoaderWithFallbackCompositeTests: XCTestCase {
    
    func test_load_deliversPrimaryFeedOnPrimaryLoaderSuccess(){
        
        let primaryFeed = uniqueFeed()
        let fallbackFeed = uniqueFeed()
        let primaryLoader =  LoaderStub(result:.success(primaryFeed))
        let fallbackLoader = LoaderStub(result:.success(fallbackFeed))
        let sut = FeedLoaderWithFallbackComposite(primary:primaryLoader,fallback: fallbackLoader)
        
        
        let exp = expectation(description: "wait for load completion")
        sut.load { result in
            switch result{
            case let .success(receivedFeed):
                XCTAssertEqual(receivedFeed, primaryFeed)
            case .failure:
                XCTFail("Expected successful load feed result,got \(result) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3)
        
    }
    
    private func uniqueFeed() -> [FeedImage] {
        return [FeedImage(id: UUID(), description: "any", location: "any", url: URL(string: "http://any-url.com")!)]
    }
    
    private class LoaderStub:FeedLoader{
        
        private let result: FeedLoader.Result
        
        init(result: FeedLoader.Result) {
            self.result = result
        }
        
        func load(completion: @escaping (FeedLoader.Result) -> Void) {
            completion(result)
        }
        
    }


}
