class ImageUploader < Shrine
  Attacher.validate do
    validate_max_size 5 * 1024 * 1024
    validate_mime_type %w[image/jpeg image/png image/gif image/jpg]
    validate_extension %w[gif jpg jpeg png]
  end
end
