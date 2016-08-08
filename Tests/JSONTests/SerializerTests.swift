////
////  ParserTests.swift
////  JSON
////
////  Created by Ethan Jackwitz on 4/19/16.
////  Copyright © 2016 Ethan Jackwitz. All rights reserved.
////
//
//import XCTest
//@testable import JSON
//
//class SerializerUnitTests: XCTestCase {
//  
//  func expect(_ input: JSON, options: JSON.Serializer.Option = [], toEqual expected: String, line: UInt = #line) {
//    do {
//      let output = try JSON.Serializer.serialize(input, options: options)
//      XCTAssertEqual(expected, output, line: line)
//    } catch {
//      XCTFail("\(error)", line: line)
//    }
//  }
//
//  func testSerializeNumber() {
//    
//    expect(1, toEqual: "1")
//    expect(-1, toEqual: "-1")
//    expect(0.1, toEqual: "0.1")
//    expect(-0.1, toEqual: "-0.1")
//    expect(1e100, toEqual: "1e+100")
//    expect(-1e100, toEqual: "-1e+100")
//    expect(123456.789, toEqual: "123456.789")
//    expect(-123456.789, toEqual: "-123456.789")
//    
//  }
//
//  func testSerializeString() {
//    
//    expect("", toEqual: surrounding(""))
//    expect("🇦🇺", toEqual: surrounding("🇦🇺"))
//    expect("vdka", toEqual: surrounding("vdka"))
//    expect(" \\ ", toEqual: surrounding(" \\ "))
//    expect("\\\"", toEqual: surrounding("\\\""))
//    expect("\\\"\t\r\n\n", toEqual: surrounding("\\\"\t\r\n\n"))
//    
//  }
//
//  func testSerializeValue() {
//    
//    expect(true, toEqual: "true")
//    expect(false, toEqual: "false")
//    
//    expect(.null, toEqual: "") // should be skipped by default
//    expect(.null, options: [.noSkipNull], toEqual: "null")
//    
//  }
//  
//  func testSerializeObject() {
//    
//    expect([:], toEqual: "{}")
//    expect(["key": 321], toEqual: "{'key':321}".substituting("'", for: "\""))
//    expect(["key": 321, "key2": true], toEqual: "{'key':321,'key2':true}".substituting("'", for: "\""))
//    
//    // null stuff
//    
//    expect(["a": 1, "b": JSON.null, "c": 2], toEqual: "{'a':1,'c':2}".substituting("'", for: "\""))
//    expect(["a": 1, "b": JSON.null, "c": 2], options: [.noSkipNull], toEqual: "{'a':1,'b':null,'c':2}".substituting("'", for: "\""))
//    expect(["a": 1, "b": JSON.null, "c": 2], options: [.prettyPrint], toEqual: "{\n    'a': 1,\n    'c': 2\n}".substituting("'", for: "\""))
//    expect(["a": 1, "b": JSON.null, "c": 2], options: [.prettyPrint, .noSkipNull], toEqual: "{\n    'a': 1,\n    'b': null,\n    'c': 2\n}".substituting("'", for: "\""))
//    
//    
//    expect(["a": 1, "b": JSON.null, "c": 2, "d": JSON.null, "e": JSON.null], toEqual: "{'a':1,'c':2}".substituting("'", for: "\""))
//    expect(["a": 1, "b": JSON.null, "c": 2, "d": JSON.null, "e": JSON.null], options: [.noSkipNull], toEqual: "{'a':1,'b':null,'c':2,'d':null,'e':null}".substituting("'", for: "\""))
//  }
//  
//  func testSerializeArray() {
//    expect([], toEqual: "[]")
//    expect([1, 2, 3, 4], toEqual: "[1,2,3,4]")
//    expect([true, false, "abc", 4, 5.0], toEqual: "[true,false,'abc',4,5.0]".substituting("'", for: "\""))
//    
//    // null stuff
//    expect([1, JSON.null, 2], toEqual: "[1,2]")
//    expect([1, JSON.null, 2], options: [.noSkipNull], toEqual: "[1,null,2]")
//    expect([1, JSON.null, 2], options: [.prettyPrint], toEqual: "[\n    1,\n    2\n]")
//    expect([1, JSON.null, 2], options: [.prettyPrint, .noSkipNull], toEqual: "[\n    1,\n    null,\n    2\n]")
//    
//    expect([1, JSON.null, JSON.null, 2, JSON.null], toEqual: "[1,2]")
//    expect([1, JSON.null, JSON.null, 2, JSON.null], options: [.noSkipNull], toEqual: "[1,null,null,2,null]")
//  }
//  
//  func testPrettyPrinting() {
//    expect([], options: [.prettyPrint], toEqual: "[]")
//    expect([:], options: [.prettyPrint], toEqual: "{}")
//    expect([1, 2], options: [.prettyPrint], toEqual: "[\n    1,\n    2\n]")
//    expect([[1, 2] as JSON, [3, 4] as JSON], options: [.prettyPrint], toEqual: "[\n    [\n        1,\n        2\n    ],\n    [\n        3,\n        4\n    ]\n]")
//    expect(["a": 1, "b": 2], options: [.prettyPrint], toEqual: "{\n    'a': 1,\n    'b': 2\n}".substituting("'", for: "\""))
//    expect(["a": [1, 2] as JSON, "b": [3] as JSON], options: [.prettyPrint], toEqual: "{\n    'a': [\n        1,\n        2\n    ],\n    'b': [\n        3\n    ]\n}".substituting("'", for: "\""))
//    
//    
//  }
//}