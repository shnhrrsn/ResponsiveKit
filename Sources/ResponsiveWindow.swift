//
//  ResponsiveWindow.swift
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

public let ResponsiveWindowSizeDidChangeNotification = "ResponsiveWindowSizeDidChangeNotification"

public class ResponsiveWindow: UIWindow, Responsive, ResponsiveViewProtocol {

	internal var responsiveSizeLastBoundsSizeCheck = CGSizeZero

	/** Responsive size relative to current orientation */
	public final var responsiveSize: ResponsiveSize {
		didSet {
			self.portraitResponsiveSize = ResponsiveLength.portraitResponsiveSizeForCGSize(self.bounds.size)
			self.responsiveSizeDidChange(self.responsiveSize)
		}
	}

	/** Responsive size if UI orientation were portrait */
	public final var portraitResponsiveSize: ResponsiveSize

	public override init(frame: CGRect) {
		self.responsiveSize = ResponsiveLength.responsiveSizeForCGSize(frame.size)
		self.portraitResponsiveSize = ResponsiveLength.portraitResponsiveSizeForCGSize(frame.size)
		super.init(frame: frame)
	}

	public required init?(coder aDecoder: NSCoder) {
		self.responsiveSize = (.Medium, .Medium)
		self.portraitResponsiveSize = (.Medium, .Medium)
		super.init(coder: aDecoder)
		self.responsiveSize = ResponsiveLength.responsiveSizeForCGSize(self.bounds.size)
		self.portraitResponsiveSize = ResponsiveLength.portraitResponsiveSizeForCGSize(frame.size)
	}

	public override func layoutSubviews() {
		super.layoutSubviews()

		self.updateResponsiveSize()
	}

	public func responsiveSizeDidChange(size: ResponsiveSize) {
		NSNotificationCenter.defaultCenter().postNotificationName(ResponsiveWindowSizeDidChangeNotification, object: self)
	}

}
