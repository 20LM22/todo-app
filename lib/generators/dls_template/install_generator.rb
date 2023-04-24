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

    def rspec
      run "bin/rails generate rspec:install"
    end

    def circle_ci
      directory ".circleci", ".circleci"
      inject_into_file "config/database.yml",
        "  username: <%= ENV[\"lando_database_creds_user\"] || \"dls_template_user\" %>\n",
        after: "database: db/test.sqlite3\n"
      gsub_file ".circleci/config.yml", "dls_template", Rails.application.class.to_s.gsub("::Application", "").underscore
    end

    def simplecov
      inject_into_file ".circleci/config.yml",
        "    - store_artifacts:\n      path: coverage\n",
        after: "- run:\n name: Run Rspec\n command: bundle exec rspec"
      inject_into_file "spec/rails_helper.rb",
        "require \"spec_helper\"\nSimpleCov.start \"rails\"\n",
        after: "require \"spec_helper\""
    end
  end
end
