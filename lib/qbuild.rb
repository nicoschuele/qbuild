require_relative "qbuild/version"
require_relative "qbuild/jshandler"

module Qbuild
  # Your code goes here...

  def self.main(arg)
    Jshandler.minify_js
  end
end
