//
//  ResponsiveView.swift
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

public class ResponsiveView: UIView, Responsive, ResponsiveViewProtocol {

	internal var responsiveSizeLastBoundsSizeCheck = CGSizeZero

	public final var responsiveSize: ResponsiveSize {
		didSet {
			self.responsiveSizeDidChange(self.responsiveSize)
		}
	}

	public override init(frame: CGRect) {
		self.responsiveSize = ResponsiveLength.responsiveSizeForCGSize(frame.size)
		super.init(frame: frame)
	}

	public required init?(coder aDecoder: NSCoder) {
		self.responsiveSize = (.Medium, .Medium)
		super.init(coder: aDecoder)
		self.responsiveSize = ResponsiveLength.responsiveSizeForCGSize(self.bounds.size)
	}

	public override func layoutSubviews() {
		super.layoutSubviews()

		self.updateResponsiveSize()
	}

	public func responsiveSizeDidChange(size: ResponsiveSize) { }

}
