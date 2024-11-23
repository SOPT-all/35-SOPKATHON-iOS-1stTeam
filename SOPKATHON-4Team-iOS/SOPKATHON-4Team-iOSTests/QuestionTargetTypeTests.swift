//
//  QuestionTargetTypeTests.swift
//  SOPKATHON-4Team-iOSTests
//
//  Created by 이명진 on 11/24/24.
//

import Testing
import XCTest
import Moya
@testable import SOPKATHON_4Team_iOS

final class QuestionTargetTypeTests: XCTestCase {
    
    var provider: MoyaProvider<QuestionTargetType>!
    
    override func setUpWithError() throws {
        super.setUp()
        // Stub 데이터 초기화
        provider = MoyaProvider<QuestionTargetType>(stubClosure: MoyaProvider.immediatelyStub)
    }
    
    override func tearDownWithError() throws {
        provider = nil
        super.tearDown()
    }
    
    func testSolveQuestionnaire() throws {
        // Given: Stub 데이터 설정
        let stubData = """
        {
            "status": 200,
            "data": {
                "answerCount": 3
            },
            "message": "요청이 성공했습니다."
        }
        """.data(using: .utf8)!
        
        let endpointClosure = { (target: QuestionTargetType) -> Endpoint in
            return Endpoint(url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                            sampleResponseClosure: { .networkResponse(200, stubData) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        provider = MoyaProvider<QuestionTargetType>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        
        let expectation = XCTestExpectation(description: "SolveQuestionnaire should return success")
        
        let answerList = [0, 0, 1]
        
        // When
        provider.request(.solveQuestionnaire(answerList: answerList)) { result in
            // Then
            switch result {
            case .success(let response):
                XCTAssertEqual(response.statusCode, 200, "Status code should be 200")
                do {
                    struct SolveResponse: Codable {
                        let answerCount: Int
                    }
                    
                    let responseDto = try response.map(BaseResponse<SolveResponse>.self)
                    XCTAssertEqual(responseDto.status, 200, "Response status should be 200")
                    XCTAssertEqual(responseDto.data?.answerCount, 3, "Answer count should match stub data")
                    XCTAssertEqual(responseDto.message, "요청이 성공했습니다.", "Response message should match")
                } catch {
                    XCTFail("Failed to decode response: \(error)")
                }
            case .failure(let error):
                XCTFail("Request failed with error: \(error)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
