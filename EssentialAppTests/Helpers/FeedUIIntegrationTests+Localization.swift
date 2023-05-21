//
//  FeedUIIntegrationTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Kai Chi Tsao on 2023/3/27.
//

import Foundation
import XCTest
import EssentialFeed_KaiLearning

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }
    
    var feedTitle: String {
        FeedPresenter.title
    }
    
    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
