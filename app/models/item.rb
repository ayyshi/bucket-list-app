class Item < ActiveRecord::Base
  belongs_to :users

  validates :title, presence: true, uniqueness: true
end
