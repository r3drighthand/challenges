class Restaurant < ActiveRecord::Base
  has_many :reviews
  belongs_to :page_creator, class_name: "User", foreign_key: :page_creator
  validates_presence_of :name, :cuisine, :address, :city, :state, :zipcode


  def average_rating
    all_ratings = [];
    self.reviews.all.each do |review|
      all_ratings << review.rating
    end
    total = all_ratings.reduce(:+)
    total/self.reviews.length
  end

  def self.states
    states = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
  end
end
