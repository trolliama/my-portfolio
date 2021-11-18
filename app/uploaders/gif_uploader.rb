require "image_processing/mini_magick"

class GifUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      static: magick.convert("jpeg").loader(page: 0).call
    }
  end
end
