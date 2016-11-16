require 'uglifier'
require 'pad_utils'
require_relative 'config'

module Qbuild
  module Jshandler
    def self.minify_js
      js_paths = Qbuild::Config.js_paths
      min_js_path = Qbuild::Config.minified_js_path
      Qbuild::Config.create_target_directory(min_js_path)
      js_paths.each do |js_path|
        Dir["#{js_path}/*.js"].each do |file|
          unless file.include? '.min.js'
            jsmin = Uglifier.new.compile(File.read(file))
            File.write("#{min_js_path}/#{name_min_file(file)}", jsmin)
          end
        end
      end
    end

    def self.name_min_file(file)
      file = File.basename file
      file.gsub(/(.*)(.js)(.*)/, '\1.min.js\3')
    end
  end
end
