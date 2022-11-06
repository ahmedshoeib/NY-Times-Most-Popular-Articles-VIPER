//
//  NetworkServiceTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import XCTest
@testable import NYTimesMostPopularArticles

final class NetworkServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func test_givenNoRechability_errorIsReturned() {
        
        let noReachability = MockNoReachability()
        
        let service = NetworkService(reachability: noReachability)
        
        
        let expectation = self.expectation(description: "resource")
        
        var resourceData: EmptyDeodable?
        var resourceError: Error?
        let request = MockRequest(url: URL(string: "https://www.google.com")!)
        
        service.build(request: request) { (result: Result<EmptyDeodable, AppErrror>) in
            print(result)
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(resourceError)
        XCTAssertNil(resourceData)
    }
    
    func test_givenRechabilityWithValidJsonRespons_errorIsReturned() {
        
        let reachability = MockAvailableReachability()
        
        let service = NetworkService(reachability: reachability)
        
        
        let expectation = self.expectation(description: "resource")
        
        var resourceData: EmptyDeodable?
        var resourceError: Error?
        let request = MockRequest(url: URL(string: "https://www.google.com")!)
        
        service.build(request: request) { (result: Result<EmptyDeodable, AppErrror>) in
            print(result)
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(resourceError)
        XCTAssertNil(resourceData)
    }
    
    func test_givenRechabilityWithValidJsonResponse_dataIsReturned() {
        
        let reachability = MockAvailableReachability()
        
        let service = NetworkService(reachability: reachability)
        
        
        let expectation = self.expectation(description: "resource")
        
        var resourceData: EmptyDeodable?
        var resourceError: Error?
        let request = MockRequest(url: URL(string: "http://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=qwiFWqKlKtPFmftmAOFrrhkMVrItwYxY")!)
        
        service.build(request: request) { (result: Result<EmptyDeodable, AppErrror>) in
            print(result)
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNil(resourceError)
        XCTAssertNotNil(resourceData)
    }
    
    func test_givenRechabilityWithInValidUrl_dataIsReturned() {
        
        let reachability = MockAvailableReachability()
        
        let service = NetworkService(reachability: reachability)
        
        
        let expectation = self.expectation(description: "resource")
        
        var resourceData: EmptyDeodable?
        var resourceError: Error?
        let request = MockRequest(url: URL(string: "https://www.blahblah.com")!)
        
        service.build(request: request) { (result: Result<EmptyDeodable, AppErrror>) in
            print(result)
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(resourceError)
        XCTAssertNil(resourceData)
    }

}
