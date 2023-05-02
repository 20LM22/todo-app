# frozen_string_literal: true

require_relative "pul_rails_template/version"
require_relative "generators/pul_rails_template/install_generator"

module PulRailsTemplate
  class Error < StandardError; end

  def self.root
    File.expand_path "../..", __FILE__
  end
end
