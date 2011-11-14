class Api::Base
  include HTTParty
  base_uri YAML.load_file(Rails.root.join("config/app_config.yml"))["data_source_url"]
end