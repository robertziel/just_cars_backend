CarrierWave.configure do |config|
  config.asset_host = ENV['ASSET_HOST'] || 'http://localhost:8080'
end
