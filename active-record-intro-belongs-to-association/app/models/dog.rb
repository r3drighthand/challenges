class Dog < ApplicationRecord
  belongs_to :owner, class_name: "Person"
end
