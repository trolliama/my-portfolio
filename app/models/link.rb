class Link < ApplicationRecord
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :profiles
    belongs_to :link_type

end
