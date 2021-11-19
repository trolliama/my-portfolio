require "image_processing/mini_magick"

class GifUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/gif]
    validate_extension %w[gif]
  end
  
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      static: magick.convert("jpeg").loader(page: 0).call
    }
  end
end
