class Category < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  #ensure name is unique
  validates_uniqueness_of :name
end