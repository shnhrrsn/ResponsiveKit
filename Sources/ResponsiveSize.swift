//
//  ResponsiveCategory.swift
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

public typealias ResponsiveSize = (width: ResponsiveLength, height: ResponsiveLength)

/**
Provides a loose representation of the width or height for a view/window

Breakpoints differ for width and height to allow more granular
width targeting on the narrower end due to most layouts scrolling
vertically and UI decisions being made based on how wide a layout
is, not how tall it is.
*/
public enum ResponsiveLength: Int {
	/**
	width <= 349.0
	height <= 424.0
	*/
	case XS

	/**
	width <= 399.0
	height <= 499.0
	*/
	case Small

	/**
	width <= 549.0
	height <= 600.0
	*/
	case Medium

	/**
	width <= 749.0
	height <= 799.0
	*/
	case Large

	/**
	width >= 750.0
	height >= 800.0
	*/
	case XL

	public static func responsiveSizeForView(view: UIView) -> ResponsiveSize {
		return self.responsiveSizeForCGSize(view.bounds.size)
	}

	public static func responsiveSizeForCGSize(size: CGSize) -> ResponsiveSize {
		return (self.responsiveLengthForWidth(size.width), self.responsiveLengthForHeight(size.height))
	}

	/** Always uses the smallest length for width, and the longest for height */
	public static func portraitResponsiveSizeForCGSize(size: CGSize) -> ResponsiveSize {
		let width = min(size.width, size.height)
		let height = max(size.width, size.height)
		return (self.responsiveLengthForWidth(width), self.responsiveLengthForHeight(height))
	}

	public static func responsiveLengthForWidth(width: CGFloat) -> ResponsiveLength {
		if width <= 349.0 {
			return .XS
		} else if width <= 399.0 {
			return .Small
		} else if width <= 549.0 {
			return .Medium
		} else if width <= 759.0 {
			return .Large
		} else {
			return .XL
		}
	}

	public static func responsiveLengthForHeight(height: CGFloat) -> ResponsiveLength {
		if height <= 424.0 {
			return .XS
		} else if height <= 499.0 {
			return .Small
		} else if height <= 599.0 {
			return .Medium
		} else if height <= 799.0 {
			return .Large
		} else {
			return .XL
		}
	}

}

extension ResponsiveLength: ResponsiveValue {

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

extension ResponsiveLength: Comparable { }

public func <(lhs: ResponsiveLength, rhs: ResponsiveLength) -> Bool {
	return lhs.rawValue < rhs.rawValue
}

public func <=(lhs: ResponsiveLength, rhs: ResponsiveLength) -> Bool {
	return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: ResponsiveLength, rhs: ResponsiveLength) -> Bool {
	return lhs.rawValue >= rhs.rawValue
}

public func >(lhs: ResponsiveLength, rhs: ResponsiveLength) -> Bool {
	return lhs.rawValue > rhs.rawValue
}

