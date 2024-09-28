//
//  Test.swift
//  DekiParser
//
//  Created by Dexter Ramos on 9/29/24.
//

import Testing
import XCTest
@testable import DekiParser

struct ParserYAMLTests {

    let fileNameDevelopers = "developers"
    
    let fileNameEmployee = "employee"

    let yamlStringWithArrayContent = #"""
    - name: deki
      department: research
    - name: omen
      department: research
    """#
    
    /// reference: https://onlineyamltools.com/minify-yaml
    let yamlStringWithArrayContent2 = #"[{name: deki, department: research}, {name: omen, department: research}]"#
    
    let yamlStringWithDictionaryContent = #"""
    name: deki
    department: Research - Mobile - iOS
    """#
    
    let yamlStringWithDictionaryContent2 = #"{name: deki, department: Research - Mobile - iOS}"#
    
    // MARK: - File To model -- Array content
    
    @Test func testYAMLToModelWithArrayContent() throws {
        let developers = try DekiParser.setupModel([Developer].self, fileName: fileNameDevelopers, type: .yaml, bundle: .module)
        
        #expect(developers[0].name == "deki")
        #expect(developers[0].department == "research")
        #expect(developers[1].name == "omen")
        #expect(developers[1].department == "research")
    }
    
    
    // MARK: - File To model -- Dictionary content

    @Test func testYAMLToModelWithDictionaryContent() throws {
        let employee = try DekiParser.setupModel(Employee.self, fileName: fileNameEmployee, type: .yaml, bundle: .module)
        
        #expect(employee.name == "deki")
        #expect(employee.department == "Research - Mobile - iOS")
    }
    
    
    // MARK: - File to collection object -- Array content
    
    @Test func testYAMLWithArrayContent() throws {
        let yaml = try DekiParser.collectionObject(fileName: fileNameDevelopers, type: .yaml, bundle: .module)
        
        guard case _ as [Any] = yaml else {
            XCTFail("Expecting array content")
            return
        }
    }
    
    
    // MARK: - File to collection object -- Dictionary content

    @Test func testYAMLToObjectWithDictionaryContent() throws {
        let yamlObject = try DekiParser.collectionObject(fileName: fileNameEmployee, type: .yaml, bundle: .module)
        
        guard case let yamlObject as [String: String] = yamlObject else {
            XCTFail("Expecting a dictionary")
            return
        }
        
        #expect(yamlObject["name"] == "deki")
        #expect(yamlObject["department"] == "Research - Mobile - iOS")
    }
    
    
    // MARK: - String To model -- Array content
    
    @Test func testStringToModelWithArrayContent() throws {
        
        let developers = try DekiParser.setupModel([Developer].self, collection: yamlStringWithArrayContent)
        
        #expect(developers[0].name == "deki")
        #expect(developers[0].department == "research")
        #expect(developers[1].name == "omen")
        #expect(developers[1].department == "research")
        
        let developers2 = try DekiParser.setupModel([Developer].self, collection: yamlStringWithArrayContent2)
        
        #expect(developers2[0].name == "deki")
        #expect(developers2[0].department == "research")
        #expect(developers2[1].name == "omen")
        #expect(developers2[1].department == "research")
    }
    
    
    // MARK: - String To model -- Dictionary content
    
    @Test func testStringToModelWithDictionaryContent() throws {
        
        let employee = try DekiParser.setupModel(Employee.self, collection: yamlStringWithDictionaryContent)
        
        #expect(employee.name == "deki")
        #expect(employee.department == "Research - Mobile - iOS")
        
        let employee2 = try DekiParser.setupModel(Employee.self, collection: yamlStringWithDictionaryContent2)
        
        #expect(employee2.name == "deki")
        #expect(employee2.department == "Research - Mobile - iOS")
    }
    
    
    // MARK: - String to collection object -- Array content
    
    @Test func testStringToObjectWithArrayContent() throws {
        
        let yamlObject = try DekiParser.collectionObject(string: yamlStringWithArrayContent)
        
        guard case let yamlObject as [[String: String]] = yamlObject else {
            XCTFail("Expecting an array")
            return
        }
        
        #expect(yamlObject[0]["name"] == "deki")
        #expect(yamlObject[0]["department"] == "research")
        #expect(yamlObject[1]["name"] == "omen")
        #expect(yamlObject[1]["department"] == "research")
        
        let yamlObject2 = try DekiParser.collectionObject(string: yamlStringWithArrayContent2)
        
        guard case let yamlObject2 as [[String: String]] = yamlObject2 else {
            XCTFail("Expecting an array")
            return
        }
        
        #expect(yamlObject2[0]["name"] == "deki")
        #expect(yamlObject2[0]["department"] == "research")
        #expect(yamlObject2[1]["name"] == "omen")
        #expect(yamlObject2[1]["department"] == "research")
        
    }
    
    
    // MARK: - String to collection object -- Dictionary content

    @Test func testStringToObjectWithDictionaryContent() throws {
        
        let yamlObject = try DekiParser.collectionObject(string: yamlStringWithDictionaryContent)
        
        guard case let yamlObject as [String: String] = yamlObject else {
            XCTFail("Expecting a dictionary")
            return
        }
        
        #expect(yamlObject["name"] == "deki")
        #expect(yamlObject["department"] == "Research - Mobile - iOS")
        
        let yamlObject2 = try DekiParser.collectionObject(string: yamlStringWithDictionaryContent2)
        
        guard case let yamlObject2 as [String: String] = yamlObject2 else {
            XCTFail("Expecting a dictionary")
            return
        }
        
        #expect(yamlObject2["name"] == "deki")
        #expect(yamlObject2["department"] == "Research - Mobile - iOS")
    }


}
