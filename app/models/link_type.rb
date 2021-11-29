class LinkType < ApplicationRecord
    has_many :links

    validates :type_name, presence: true, uniqueness: true
    validates :icon, presence: true, uniqueness: true
end
