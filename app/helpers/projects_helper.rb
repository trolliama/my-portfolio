module ProjectsHelper
  def image_generator(height:, width:)
    "https://via.placeholder.com/#{width}x#{height}"
  end

  def project_img(img, type)
    if img.present?
      img
    elsif type == "thumb"
      image_generator(height: "250", width: "400")
    elsif type == "main"
      image_generator(height: "450", width: "800")
    end
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      no_intra_emphasis: true,
      space_after_headers: true,
      tables: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
