require 'uglifier'
require 'pad_utils'
require_relative 'config_reader'

module Qbuild
  module Jshandler
    def self.minify_js
      js_paths = Qbuild::Config.js_paths
      js_paths.each do |js_path|
        Dir["#{js_path}/*.js"].each do |file|
          unless file.include? '.min.js'
            jsmin = Uglifier.new.compile(File.read(file))
            File.write(name_min_file(file), jsmin)
          end
        end
      end
    end

    def self.name_min_file(file)
      file.gsub(/(.*)(.js)(.*)/, '\1.min.js\3')
    end
  end
end
