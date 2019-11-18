class ItemImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  def store_dir
    "#{super}/item/#{mounted_as}/#{model.id}"
  end

  version :search do
    process resize_to_fill: [490, 310]
    process optimize: [{ quiet: true }]
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
