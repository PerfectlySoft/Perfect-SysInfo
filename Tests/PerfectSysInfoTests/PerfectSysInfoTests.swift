//
//  PerfectSysInfoTests.swift
//  Perfect SysInfo
//
//  Created by Rockford Wei on May 3rd, 2017.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2017 - 2018 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//
import XCTest
@testable import PerfectSysInfo

class PerfectSysInfoTests: XCTestCase {
  func testExample() {
    let cpu = SysInfo.CPU
    guard cpu.count > 0 else {
      XCTFail("CPU FAULT")
      return
    }
    print(cpu)
    let mem = SysInfo.Memory
    guard mem.count > 0 else {
      XCTFail("MEM FAULT")
      return
    }
    print(mem)
  }
  static var allTests = [
    ("testExample", testExample),
    ]
}
