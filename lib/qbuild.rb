require_relative 'qbuild/version'
require_relative 'qbuild/config'
require_relative 'qbuild/jshandler'

module Qbuild
  def self.main(arg)
    if arg[0] == '--init' || arg[0] == '-i'
      init
    elsif arg[0] == '--version' || arg[0] == '-v'
      display_version
    elsif arg[0] == '--options' || arg[0] == '-o'
      display_options
    elsif arg[0] == 'run'
      build_this_thing
    else
      display_help
    end
  end

  private

  def self.init
    Qbuild::Config.init
    puts
    PadUtils.puts_c "Qbuild initialized.", :green
    PadUtils.puts_c "Update options in '.qbuild.json'"
    puts
  rescue
    PadUtils.puts_c "Something went really wrong.", :red
  end

  def self.build_this_thing
    puts
    PadUtils.puts_c "Minifying JavaScript...", :green
    Qbuild::Jshandler.minify_js

  rescue
    PadUtils.puts_c "Something went really wrong.", :red
  end

  def self.display_options
    js_paths = Qbuild::Config.js_paths
    PadUtils.puts_c 'js_paths:', :blue
    js_paths.each do |path|
      puts "- #{path}"
    end

    stylesheets_paths = Qbuild::Config.stylesheets_paths
    PadUtils.puts_c 'stylesheets_paths:', :blue
    stylesheets_paths.each do |path|
      puts "- #{path}"
    end

    PadUtils.puts_c 'minified_js_path:', :blue
    puts "- #{Qbuild::Config.minified_js_path}"

    PadUtils.puts_c 'minified_stylesheets_path', :blue
    puts "- #{Qbuild::Config.minified_stylesheets_path}"

    PadUtils.puts_c 'stylesheet_name:', :blue
    puts "- #{Qbuild::Config.stylesheet_name}"

    pre_build = Qbuild::Config.pre_build
    PadUtils.puts_c 'pre_build:', :blue
    unless pre_build.nil?
      pre_build.each do |pre|
        puts "- #{pre}"
      end
    end

    post_build = Qbuild::Config.post_build
    PadUtils.puts_c 'post_build:', :blue
    unless post_build.nil?
      post_build.each do |post|
        puts "- #{post}"
      end
    end
  end

  def self.display_help
    # TODO: Add some help
    puts 'Todo...'
  end

  def self.display_version
    # TODO: Display current version & info
    puts 'Version...'
  end
end
