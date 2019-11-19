class ItemImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  def store_dir
    "#{super}/item/#{mounted_as}/#{model.id}"
  end

  version :full do
    process resize_to_fill: [1216, 600]
    process optimize: [{ quiet: true }]
  end

  version :search do
    process resize_to_fill: [390, 250]
    process optimize: [{ quiet: true }]
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
