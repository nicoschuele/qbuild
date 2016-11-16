require 'sass'
require 'pad_utils'

module Qbuild
  module StylesheetHandler
    def self.transpile_and_minify_style
      style_formats = ['.css', '.scss']
      style_filenames = Qbuild::Config.stylesheet_filenames
      min_style_path = Qbuild::Config.minified_stylesheets_path
      min_style_file = Qbuild::Config.stylesheet_name
      Qbuild::Config.create_target_directory(min_style_path)
      content = ""
      style_filenames.each do |file|
          next unless style_formats.include? File.extname(file)
          next if file.include? '.min.css'
          content += "\n#{File.read(file)}"
      end
      minified = scss_to_css content
      File.write("#{min_style_path}/#{min_style_file}", minified)
    end

    def self.scss_to_css(content)
      sass_engine = Sass::Engine.new(content, style: :compressed,
                                              syntax: :scss,
                                              cache: false)
      sass_engine.render
    end
  end
end
