class ImageUploader < ApplicationUploader

  def accept_extensions
    accept_list = extension_whitelist.map { |e| "image/#{e}" }
    accept_list.join(",")
  end
end
