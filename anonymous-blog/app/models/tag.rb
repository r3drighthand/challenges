class Tag < ApplicationRecord
  has_many :entry_tags, { foreign_key: :tag_id }

  validates :name, :presence => true
end
