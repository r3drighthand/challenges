class EntryTagID < ApplicationRecord
  belongs_to :entry
  belongs_to :tag

  validates :entry, :presence => true
  validates :tag, :presence => true
end
