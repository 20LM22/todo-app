gem "dls_template"

run "bundle install"
generate "dls_template:install", "-f"

# Remove unneeded dls_template gem from Gemfile.
gemfile = File.expand_path("Gemfile")
File.write(gemfile, File.open(gemfile) do |f|
                      text = f.read
                      text.gsub(/^gem "dls_template"$/, "")
                    end)
