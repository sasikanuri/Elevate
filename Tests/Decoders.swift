//
//  Decoders.swift
//
//  Copyright (c) 2015-2016 Nike, Inc. (https://www.nike.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Elevate
import Foundation

struct TestObjectDecoder: Decoder {
    func decode(_ object: AnyObject) throws -> Any {
        struct KeyPath {
            static let subUInt = "subUInt"
            static let subInt = "subInt"
            static let subString = "subString"
        }

        let properties = try Parser.parseProperties(from: object) { make in
            make.property(forKeyPath: KeyPath.subUInt, type: .uint)
            make.property(forKeyPath: KeyPath.subInt, type: .int)
            make.property(forKeyPath: KeyPath.subString, type: .string)
        }

        return TestObject(
            subUInt: properties <-! KeyPath.subUInt,
            subInt: properties <-! KeyPath.subInt,
            subString: properties <-! KeyPath.subString
        )
    }
}
