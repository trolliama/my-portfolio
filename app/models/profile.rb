class Profile < ApplicationRecord
    has_one_attached :picture

    @@contexts = [:technologies, :skills]

    include TagManager
    
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :links

    acts_as_taggable_on(*@@contexts)

    validates :picture, attached: true,
                    content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
