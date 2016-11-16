require 'pad_utils'

module Qbuild
  module Config
    INIT_CONFIG_FILE = "#{File.dirname(__FILE__)}/../assets/.qbuild.json".freeze

    def self.init
      PadUtils.copy_file(INIT_CONFIG_FILE, '.')
    end

    def self.js_paths
      read_key(:js_paths)
    end

    def self.stylesheets_paths
      read_key(:stylesheets_paths)
    end

    def self.stylesheet_name
      read_key(:stylesheet_name)
    end

    def self.pre_build
      read_key(:pre_build, true)
    end

    def self.post_build
      read_key(:post_build, true)
    end

    private

    def self.read_key(key, optional = false)
      blow_up unless PadUtils.file_exist?('.qbuild.json')
      config = PadUtils.json_file_to_hash('.qbuild.json')
      if !optional && config[key].nil?
        blow_up(key)
      else
        config[key]
      end
    end

    def self.blow_up(key = nil)
      error_message = ''
      if key.nil?
        error_message = "Config file '.qbuild.json' not found. Run 'qbuild --init'."
      else
        error_message = "The key '#{key}' was not found in '.qbuild.json'. Aborting build."
      end
      PadUtils.puts_c error_message, :red
      exit
    end
  end
end
