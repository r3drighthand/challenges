class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :reviewer_id
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  has_many :created_pages, class_name: "Restaurant", foreign_key: :page_creator
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def password
    self.password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(password_text)
    BCrypt::Password.new(self.password_hash) == password_text
  end
end
