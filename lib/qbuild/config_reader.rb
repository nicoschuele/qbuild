require 'pad_utils'

module ConfigReader
  def self.options
    opts = {}
    unless PadUtils.file_exist?('.qbuild.json')
      opts = { js_path: 'scripts', scss_path: 'stylesheets', css_path: 'stylesheets' }
      return opts
    end
    conf = read_config
    opts = { js_path: conf[:js_path], scss_path: conf[:scss_path], css_path: [:css_path] }
    opts
  end

  def self.read_config
    PadUtils.json_file_to_hash('.qbuild.json')
  end
end
