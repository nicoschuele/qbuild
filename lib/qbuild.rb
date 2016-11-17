require_relative 'qbuild/version'
require_relative 'qbuild/config'
require_relative 'qbuild/jshandler'
require_relative 'qbuild/stylesheet_handler'
require_relative 'qbuild/build_action'

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
    PadUtils.puts_c 'Qbuild initialized.', :green
    PadUtils.puts_c "Update options in '.qbuild.json'"
    puts
  rescue
    PadUtils.puts_c 'Something went really wrong.', :red
  end

  def self.build_this_thing
    start_time = Time.now
    puts
    unless Qbuild::Config.pre_build.nil? || Qbuild::Config.pre_build.empty?
      PadUtils.puts_c 'Running pre-build scripts...', :green
      Qbuild::BuildAction.run_pre_build_actions
    end
    PadUtils.puts_c 'Minifying JavaScript...', :green
    Qbuild::Jshandler.minify_js
    PadUtils.puts_c 'Converting Sass & minifying CSS...', :green
    Qbuild::StylesheetHandler.transpile_and_minify_style
    unless Qbuild::Config.post_build.nil? || Qbuild::Config.post_build.empty?
      PadUtils.puts_c 'Running post-build scripts...', :green
      Qbuild::BuildAction.run_post_build_actions
    end
    end_time = Time.now
    interval = PadUtils.interval(start_time, end_time, :seconds)
    puts
    PadUtils.puts_c "Completed in #{interval} seconds!", :green
  end

  def self.display_options
    js_paths = Qbuild::Config.js_paths
    PadUtils.puts_c 'js_paths:', :blue
    js_paths.each do |path|
      puts "- #{path}"
    end

    stylesheet_filenames = Qbuild::Config.stylesheet_filenames
    PadUtils.puts_c 'stylesheet_filenames:', :blue
    stylesheet_filenames.each do |path|
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
    puts
    PadUtils.puts_c "Qbuild #{Qbuild::VERSION}", :blue
    PadUtils.puts_c "************", :blue
    puts
    PadUtils.puts_c "Init:         qbuild --init"
    PadUtils.puts_c "View options: qbuild --options"
    PadUtils.puts_c "Build:        qbuild run"
    puts
  end

  def self.display_version
    puts
    PadUtils.puts_c "Qbuild #{Qbuild::VERSION}", :blue
    PadUtils.puts_c "************", :blue
    PadUtils.puts_c "https://github.com/nicoschuele/qbuild"
    PadUtils.puts_c "Contact: @nicoschuele"
    puts
  end
end
