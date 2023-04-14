# frozen_string_literal: true

require_relative "dls_template/version"
require_relative "generators/dls_template/install_generator"

module DlsTemplate
  class Error < StandardError; end

  def self.root
    File.expand_path '../..', __FILE__
  end
end
