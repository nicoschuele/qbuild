require 'sass'
require 'pad_utils'

module Qbuild
  module StylesheetHandler
    def self.transpile_and_minify_style
      style_formats = ['.css', '.scss']
      style_filenames = Qbuild::Config.stylesheet_filenames
      min_style_path = Qbuild::Config.minified_stylesheets_path
      Qbuild::Config.create_target_directory(min_style_path)
      style_filenames.each do |file|
          next unless style_formats.include? File.extname(file)
          next if file.include? '.min.css'
          minified = scss_to_css(File.read(file))
          File.write("#{min_style_path}/#{name_min_file(file)}", minified)
          #TODO: Generate only one stylesheet
      end
    end

    def self.name_min_file(file)
      file = File.basename file
      if File.extname(file) == '.css'
        file.gsub(/(.*)(.css)(.*)/, '\1.min.css\3')
      else
        file.gsub(/(.*)(.scss)(.*)/, '\1.min.css\3')
      end
    end

    def self.scss_to_css(content)
      sass_engine = Sass::Engine.new(content, style: :compressed,
                                              syntax: :scss,
                                              cache: false)
      sass_engine.render
    end
  end
end
