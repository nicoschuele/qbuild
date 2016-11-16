module Qbuild
  module BuildAction
    def self.run_pre_build_actions
      actions = Qbuild::Config.pre_build
      unless actions.nil?
        actions.each do |action|
          system action.to_s
        end
      end
    end

    def self.run_post_build_actions
      actions = Qbuild::Config.post_build
      unless actions.nil?
        actions.each do |action|
          system action.to_s
        end
      end
    end
  end
end
