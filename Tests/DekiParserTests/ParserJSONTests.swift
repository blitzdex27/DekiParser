//
//  Test.swift
//  DekiParser
//
//  Created by Dexter Ramos on 9/29/24.
//

import Testing
import XCTest
@testable import DekiParser

struct ParserJSONTests {
    
    let fileNameDevelopers = "developers"
    
    let fileNameEmployee = "employee"
    
    let jsonStringWithArrayContent = #"""
    [
        {
            "name": "deki",
            "department": "research"
        },
        {
            "name": "omen",
            "department": "research"
        }
    ]
    """#
    let jsonStringWithArrayContent2 = #"[{"name":"deki","department":"research"},{"name":"omen","department":"research"}]"#
    
    let jsonStringWithDictionaryContent = #"""
    {
        "name": "deki",
        "department": "Research - Mobile - iOS"
    }
    """#
    
    let jsonStringWithDictionaryContent2 = #"{"name":"deki","department":"Research - Mobile - iOS"}"#

    @Test func testJSONToModelWithArrayContent() throws {
        let developers = try DekiParser.setupModel(
            [Developer].self,
            fileName: fileNameDevelopers,
            type: .json,
            bundle: Bundle.module
        )


        #expect(developers[0].name == "deki")
        #expect(developers[0].department == "research")
        #expect(developers[1].name == "omen")
        #expect(developers[1].department == "research")
    }

    // MARK: - File To model -- Dictionary content
    
    @Test func testJSONToModelWithDictionaryContent() throws {
        let employee = try DekiParser.setupModel(
            Employee.self,
            fileName: fileNameEmployee,
            type: .json,
            bundle: .module
        )
        
        #expect(employee.name == "deki")
        #expect(employee.department == "Research - Mobile - iOS")
    }
    
    
    // MARK: - File to collection object -- Array content

    @Test func testJSONToObjectWithArrayContent() throws {
        let jsonObject = try DekiParser.collectionObject(
            fileName: fileNameDevelopers,
            type: .json,
            bundle: .module
        )
        
        guard case let jsonObject as [[String: String]] = jsonObject else {
            XCTFail("Expecting array content")
            return
        }
        
        #expect(jsonObject[0]["name"] == "deki")
        #expect(jsonObject[0]["department"] == "research")
        #expect(jsonObject[1]["name"] == "omen")
        #expect(jsonObject[1]["department"] == "research")
    }
    
    
    // MARK: - File to collection object -- Dictionary content
    
    @Test func testJSONToObjectWithDictionaryContent() throws {
        let jsonObject = try DekiParser.collectionObject(
            fileName: fileNameEmployee,
            type: .json,
            bundle: .module
        )
        
        guard case let jsonObject as [String: String] = jsonObject else {
            XCTFail("Expecting a dictionary")
            return
        }
        
        #expect(jsonObject["name"] == "deki")
        #expect(jsonObject["department"] == "Research - Mobile - iOS")
    }
    
    
    // MARK: - String To model -- Array content
    
    @Test func testStringToModelWithArrayContent() throws {
        
        let developers = try DekiParser.setupModel(
            [Developer].self,
            collection: jsonStringWithArrayContent
        )
        
        #expect(developers[0].name == "deki")
        #expect(developers[0].department == "research")
        #expect(developers[1].name == "omen")
        #expect(developers[1].department == "research")
        
        let developers2 = try DekiParser.setupModel([Developer].self, collection: jsonStringWithArrayContent2)
        
        #expect(developers2[0].name == "deki")
        #expect(developers2[0].department == "research")
        #expect(developers2[1].name == "omen")
        #expect(developers2[1].department == "research")
    }
    
    
    // MARK: - String To model -- Dictionary content
    
    @Test func testStringToModelWithDictionaryContent() throws {
        
        let employee = try DekiParser.setupModel(
            Employee.self,
            collection: jsonStringWithDictionaryContent
        )
        
        #expect(employee.name == "deki")
        #expect(employee.department == "Research - Mobile - iOS")
        
        let employee2 = try DekiParser.setupModel(Employee.self, collection: jsonStringWithDictionaryContent2)
        
        #expect(employee2.name == "deki")
        #expect(employee2.department == "Research - Mobile - iOS")
    }
    
    
    // MARK: - String to collection object -- Array content
    
    @Test func testStringToObjectWithArrayContent() throws {
        
        let jsonObject = try DekiParser.collectionObject(string: jsonStringWithArrayContent)
        
        guard case let jsonObject as [[String: String]] = jsonObject else {
            XCTFail("Expecting an array")
            return
        }
        
        #expect(jsonObject[0]["name"] == "deki")
        #expect(jsonObject[0]["department"] == "research")
        #expect(jsonObject[1]["name"] == "omen")
        #expect(jsonObject[1]["department"] == "research")
        
        let jsonObject2 = try DekiParser.collectionObject(string: jsonStringWithArrayContent2)
        
        guard case let jsonObject2 as [[String: String]] = jsonObject2 else {
            XCTFail("Expecting an array")
            return
        }
        
        #expect(jsonObject2[0]["name"] == "deki")
        #expect(jsonObject2[0]["department"] == "research")
        #expect(jsonObject2[1]["name"] == "omen")
        #expect(jsonObject2[1]["department"] == "research")
        
    }
    
    // MARK: - String to collection object -- Dictionary content

    @Test func testStringToObjectWithDictionaryContent() throws {
        
        let jsonObject = try DekiParser.collectionObject(string: jsonStringWithDictionaryContent)
        
        guard case let jsonObject as [String: String] = jsonObject else {
            XCTFail("Expecting a dictionary")
            return
        }
        
        #expect(jsonObject["name"] == "deki")
        #expect(jsonObject["department"] == "Research - Mobile - iOS")
        
        let jsonObject2 = try DekiParser.collectionObject(string: jsonStringWithDictionaryContent2)
        
        guard case let jsonObject2 as [String: String] = jsonObject2 else {
            XCTFail("Expecting a dictionary")
            return
        }
        
        #expect(jsonObject2["name"] == "deki")
        #expect(jsonObject2["department"] == "Research - Mobile - iOS")
    }
    
}


