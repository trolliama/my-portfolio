class Profile < ApplicationRecord
    @@contexts = [:technologies, :skills]

    include TagManager
    
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :links

    acts_as_taggable_on(*@@contexts)

end
