class Link < ApplicationRecord
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :profiles
    belongs_to :link_type

    validates :name, presence: true, uniqueness: true
    validates :link, presence: true, uniqueness: true
    validates :tooltip, presence: true
end
