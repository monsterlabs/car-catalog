# encoding: utf-8
class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [30, 30]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
