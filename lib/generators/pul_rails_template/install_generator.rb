# frozen_string_literal: true

require "rails/generators"

module PulRailsTemplate
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
        "  username: <%= ENV[\"lando_database_creds_user\"] || \"pul_rails_template_user\" %>\n",
        after: "database: db/test.sqlite3\n"
      gsub_file ".circleci/config.yml", "pul_rails_template", Rails.application.class.to_s.gsub("::Application", "").underscore
    end

    def simplecov
      inject_into_file "spec/rails_helper.rb",
        "require \"simplecov\"\nSimpleCov.start \"rails\"\n",
        after: "require 'spec_helper'\n"
    end

    def capistrano
      run "bundle exec cap install"
      inject_into_file "config/deploy.rb",
        "\n# Default branch is :main\nset :branch, ENV[\"BRANCH\"] || \"main\"\n",
        after: "set :repo_url, \"git@example.com:me/my_repo.git\"\n"
    end

    def axe
      inject_into_file "spec/rails_helper.rb", "require 'axe-rspec'\n", after: "require 'spec_helper'\n"
      gsub_file "app/views/layouts/application.html.erb", "<html>", "<html lang=\"en\">"
      run "mkdir ./spec/features"
      copy_file "accessibility_spec.rb", "./spec/features/accessibility_spec.rb"
    end
  end
end
