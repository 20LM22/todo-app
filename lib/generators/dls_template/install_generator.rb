# frozen_string_literal: true

require "rails/generators"

module DlsTemplate
  class Install < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def asdf_tool_versions
      copy_file ".tool-versions", ".tool-versions"
    end

    def rubocop
      copy_file ".rubocop.yml", ".rubocop.yml"
    end
  end
end
