class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/gif image/jpg]
    validate_extension %w[gif jpg jpeg png]
  end

  
end
