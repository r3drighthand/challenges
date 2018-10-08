class Entry < ApplicationRecord
  belongs_to :horse
  belongs_to :jockey
  belongs_to :race
end
