//
//  ResponsiveViewProtocol.swift
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


internal protocol ResponsiveViewProtocol: AnyObject, Responsive {

	var responsiveSizeLastBoundsSizeCheck: CGSize { get set }

	var responsiveSize: ResponsiveSize { get set }
	var bounds: CGRect { get }

}

internal extension ResponsiveViewProtocol {

	func updateResponsiveSize() {
		let boundsSize = self.bounds.size

		if self.responsiveSizeLastBoundsSizeCheck != boundsSize {
			let size = ResponsiveLength.responsiveSizeForCGSize(self.bounds.size)

			if size.width != self.responsiveSize.width || size.height != self.responsiveSize.height {
				self.responsiveSize = size
			}

			self.responsiveSizeLastBoundsSizeCheck = boundsSize
		}
	}

}

