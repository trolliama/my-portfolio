class Project < ApplicationRecord
    has_and_belongs_to_many :profiles
    has_and_belongs_to_many :links

    acts_as_taggable_on :technologies, :skills

    validates_presence_of :title, :description, :resume_card, :body
end
