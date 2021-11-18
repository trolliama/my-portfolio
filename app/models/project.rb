class Project < ApplicationRecord
  include GifUploader::Attachment(:gif_image)

  @@contexts = [:technologies, :skills]

  include TagManager
  include Filterable

  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :links

  acts_as_taggable_on(*@@contexts)

  scope :filter_by_all_tags, ->(tags) {
          self.tagged_with(tags, :any => true)
        }

  validates_presence_of :title, :description, :resume_card, :body

  def demo_link
    self.links.where(link_type_id: LinkType.where(type_name: "demo").first.id).first
  end
end
