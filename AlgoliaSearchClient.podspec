Pod::Spec.new do |spec|
  spec.name         = "AlgoliaSearchClient"
  spec.module_name  = 'AlgoliaSearchClient'
  spec.version      = "8.20.1"
  spec.summary      = "Algolia Search API Client written in Swift."
  spec.homepage     = "https://github.com/algolia/algoliasearch-client-swift"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { 'Algolia' => 'contact@algolia.com'  }
  spec.documentation_url = "https://www.algolia.com/doc/api-client/getting-started/what-is-the-api-client/swift/"
  spec.platforms = { :ios => "14.0", :osx => "11.0", :watchos => "7.0", :tvos => "14.0" }
  spec.swift_version = "5.1"
  spec.source = { :git => "https://github.com/algolia/algoliasearch-client-swift.git", :tag => spec.version }
  spec.source_files  = "Sources/AlgoliaSearchClient/**/*.swift"
  spec.resource_bundles = { 'AlgoliaSearchClient' => ['PrivacyInfo.xcprivacy']}
end
