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
import Foundation

class PerfectSysInfoTests: XCTestCase {
  func testCPU() {
    let cpu = SysInfo.CPU
    guard cpu.count > 0 else {
      XCTFail("CPU FAULT")
      return
    }
    print(cpu)
  }
  func testMEM() {
    let mem = SysInfo.Memory
    guard mem.count > 0 else {
      XCTFail("MEM FAULT")
      return
    }
    print(mem)
  }
  func testNET() {
    let net = SysInfo.Net
    guard net.count >  0 else {
      XCTFail("NET FAULT")
      return
    }
    print(net)
  }
  func testDISK() {
    let io = SysInfo.Disk
    guard io.count > 0 else {
      XCTFail("DISK FAULT")
      return
    }
    print(io)
  }
  func testLEAK() {
    let exp = self.expectation(description: "leak")
    for _ in 0 ... 1000 {
      _ = SysInfo.CPU
      _ = SysInfo.Memory
      _ = SysInfo.Net
      #if os(Linux)
        _ = SysInfo.Disk
      #else
      autoreleasepool(invoking: {
        _ = SysInfo.Disk
      })
      #endif
      usleep(10000)
    }
    exp.fulfill()
    waitForExpectations(timeout: 1) { _ in }
  }

  static var allTests = [
    ("testCPU", testCPU),
    ("testMEM", testMEM),
    ("testNET", testNET),
    ("testDISK", testDISK),
    ("testLEAK", testLEAK),
    ]
}
