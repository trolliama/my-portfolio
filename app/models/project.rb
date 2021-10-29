class Project < ApplicationRecord
    @@contexts = [:technologies, :skills]

    include TagManager
    include Filterable

    has_and_belongs_to_many :profiles
    has_and_belongs_to_many :links

    acts_as_taggable_on(*@@contexts)

    scope :filter_by_all_tags, -> (tags) {
        self.tagged_with(tags, :any => true)
    }

    validates_presence_of :title, :description, :resume_card, :body
end
