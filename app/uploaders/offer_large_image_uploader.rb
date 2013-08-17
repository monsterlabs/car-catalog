# encoding: utf-8

class OfferLargeImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [758, 320]

  def extension_white_list
    %w(jpg)
  end
end
