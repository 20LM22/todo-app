require "bundler/gem_tasks"
require "fileutils"
require "./lib/dls_template"

desc "Generate test app"
task :generate do
  test_app_dir = File.join(DlsTemplate.root, ".test_app")
  FileUtils.rm_rf(test_app_dir) if Dir.exist?(test_app_dir)
  system "GEM_TEST=true rails new --skip-bundle --no-rc .test_app -m template.rb"
  generator = DlsTemplate::Install.new
  generator.destination_root = test_app_dir
  generator.invoke_all
end
