module ProjectsHelper
    def image_generator(height:, width:)
        "https://via.placeholder.com/#{width}x#{height}"
    end

    def project_img img, type
        if type == 'thumb'
            image_generator(height: '300', width: '400')
        elsif type == 'main'
            image_generator(height: '500', width: '800')
        end
    end
end
