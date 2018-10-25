class Entry < ApplicationRecord
  has_many :entry_tags, { foreign_key: :entry_id }

  validates :body, :presence => true
  validates :title, :presence => true
end
