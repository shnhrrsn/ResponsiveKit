Pod::Spec.new do |s|

	s.name         = "ResponsiveKit"
	s.version      = "0.2"
	s.summary      = "Swift framework for working with various view sizes in iOS."
	s.homepage     = "https://github.com/shnhrrsn/ResponsiveKit"
	s.license      = "MIT"

	s.author       = "Shaun Harrison"
	s.social_media_url   = "http://twitter.com/shnhrrsn"

	s.platform     = :ios, "8.0"

	s.source       = { :git => "https://github.com/shnhrrsn/ResponsiveKit.git", :tag => s.version }

	s.source_files = "Sources/*.swift"
	s.requires_arc = true

end