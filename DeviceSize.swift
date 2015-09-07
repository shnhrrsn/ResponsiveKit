//
//  DeviceSize.swift
//  ResponsiveKit
//
//  Copyright (c) 2015 Shaun Harrison
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

/**
Provides a loose representation of the device size.

Key metrics are intentionally fuzzy for future proofing, so
correlations to existing devices are considered approximate.
*/
public enum DeviceSize {
	/** Size ~= iPhone 3.5" */
	case XS

	/** Size ~= iPhone 4" */
	case Small

	/** Size ~= iPhone 4.7" */
	case Medium

	/** Size ~= iPhone 5.5" */
	case Large

	/** Size ~= iPad */
	case XL

	/** Determine a device size from a screen size */
	public static func responsiveSizeForScreenSize(size: CGSize) -> DeviceSize {
		let width = min(size.width, size.height)

		if width <= 340.0 {
			let height = max(size.width, size.height)

			if height <= 510.0 {
				return .XS
			} else {
				return .Small
			}
		} else if width <= 400.0 {
			return .Medium
		} else if width <= 680.0 {
			return .Large
		} else {
			return .XL
		}
	}

}

extension DeviceSize: ResponsiveValue {

	public func value<T>(xsValue: T, _ smallValue: T, _ mediumValue: T, _ largeValue: T, _ xlValue: T) -> T {
		switch(self) {
			case .XL:
				return xlValue
			case .Large:
				return largeValue
			case .Medium:
				return mediumValue
			case .Small:
				return smallValue
			case .XS:
				return xsValue
		}
	}

}

public extension UIDevice {
	private static var size: DeviceSize?

	public var size: DeviceSize {
		if let size = self.dynamicType.size {
			return size
		} else {
			let size = DeviceSize.responsiveSizeForScreenSize(UIScreen.mainScreen().bounds.size)
			self.dynamicType.size = size
			return size
		}
	}

}
