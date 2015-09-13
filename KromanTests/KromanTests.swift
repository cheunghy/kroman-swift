//
//  KromanTests.swift
//  KromanTests
//
//  Created by Kai Yu on 9/13/15.
//  Copyright © 2015 Zhang Kai Yu. All rights reserved.
//

import XCTest
@testable import Kroman

class KromanTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testKroman() {
        let result = Kroman.parse("희망은 잠들지 않는 꿈")
        XCTAssertEqual(result, "heui-mang-eun jam-deur-ji anh-neun ggum")
    }
}
