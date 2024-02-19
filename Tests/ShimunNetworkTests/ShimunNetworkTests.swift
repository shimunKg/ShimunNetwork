import XCTest
@testable import ShimunNetwork

final class ShimunNetworkTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    override func tearDownWithError() throws {
        
    }
    
    func testJsonRoundTrip() {
        // Given
        let jsonExample = """
        {
            "name": "John Doe",
            "age": 30,
            "email": "johndoe@example.com"
        }
        """
        
        let expectedObject = JsonExample(name: "John Doe", age: 30, email: "johndoe@example.com")
        guard let jsonData = jsonExample.data(using: .utf8) else {
            XCTFail("Failed to convert jsonExample string to Data")
            return
        }

        // When
        do {
            let decoder = JSONDecoder()
            let encoder = JSONEncoder()
            
            // Decode
            let decodedObject = try decoder.decode(JsonExample.self, from: jsonData)
            XCTAssertEqual(decodedObject, expectedObject, "Decoded object does not match the expected object.")
            
            // Encode
            let encodedData = try encoder.encode(decodedObject)
            
            // Decode again to verify encoding did not alter the data
            let reDecodedObject = try decoder.decode(expect: JsonExample.self, from: encodedData)
            XCTAssertEqual(reDecodedObject, expectedObject, "Object altered after encoding and decoding again.")

            // Optional: Direct comparison of JSON
            // Note: This step might require normalization if the order of keys or formatting could vary.
            if let encodedJsonString = String(data: encodedData, encoding: .utf8) {
                let normalizedEncodedJson = try JSONSerialization.jsonObject(with: encodedData)
                let normalizedExpectedJson = try JSONSerialization.jsonObject(with: jsonData)
                XCTAssertEqual(normalizedEncodedJson as? NSDictionary, normalizedExpectedJson as? NSDictionary, "Encoded JSON differs from the original JSON.")
            }
            
        } catch {
            XCTFail("Unexpected error during test: \(error)")
        }
    }
    
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}

fileprivate struct JsonExample: Codable {
    let name: String
    let age: Int
    let email: String
}

extension JsonExample: Equatable {}
