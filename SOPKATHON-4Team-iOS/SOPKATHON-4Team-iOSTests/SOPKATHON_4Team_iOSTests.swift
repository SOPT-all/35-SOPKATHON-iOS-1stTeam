//
//  SOPKATHON_4Team_iOSTests.swift
//  SOPKATHON-4Team-iOSTests
//
//  Created by 이명진 on 11/24/24.
//

import XCTest
import Moya
@testable import SOPKATHON_4Team_iOS

final class AuthTargetTypeTests: XCTestCase {
    
    var provider: MoyaProvider<AuthTargetType>!
    
    override func setUpWithError() throws {
        super.setUp()
        provider = MoyaProvider<AuthTargetType>(stubClosure: MoyaProvider.immediatelyStub)
    }
    
    override func tearDownWithError() throws {
        provider = nil
        super.tearDown()
    }
    
    func testSignInSuccess() throws {
        // Given: Stub 데이터 설정
        let stubData = """
        {
            "status": 201,
            "message": "회원 가입 성공.",
            "data": {
                "memberId": 1
            }
        }
        """.data(using: .utf8)!
        
        let endpointClosure = { (target: AuthTargetType) -> Endpoint in
            return Endpoint(url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                            sampleResponseClosure: { .networkResponse(201, stubData) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        provider = MoyaProvider<AuthTargetType>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        
        let expectation = XCTestExpectation(description: "SignIn should return success")
        
        // When
        provider.request(.signIn(nickName: "TestUser")) { result in
            // Then
            switch result {
            case .success(let response):
                XCTAssertEqual(response.statusCode, 201, "Status code should be 201")
                do {
                    let responseDto = try response.map(BaseResponse<AuthAPI>.self)
                    XCTAssertEqual(responseDto.status, 201, "Response status should be 201")
                    XCTAssertEqual(responseDto.data?.memberId, 1, "Member ID should match stub data")
                    XCTAssertEqual(responseDto.message, "회원 가입 성공.", "Response message should match")
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
