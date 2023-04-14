require "spec_helper"
require "./lib/dls_template"

RSpec.describe "Template generator" do
  let(:test_dir) { File.join(DlsTemplate.root, ".test_app") }

  before(:all) do
    system "rake generate"
  end

  it "installs an asdf .tool-versions file" do
    path = File.join(test_dir, ".tool-versions")
    expect(File.exist?(path)).to be true
  end

  it "installs bixy gem and a rubocop.yml file" do
    gemfile = File.read(File.join(test_dir, "Gemfile"))
    rubocop_path = File.join(test_dir, ".rubocop.yml")
    expect(gemfile).to include "bixby"
    expect(File.exist?(rubocop_path)).to be true
  end
end
