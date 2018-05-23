class Boat < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :bookings
  CATEGORIES = ['Sailboat', 'Motorboat', 'Catamaran', 'Jet ski', 'Houseboat']
  validates :name, presence: :true
  validates :address, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true
  validates :model, presence: :true
  validates :capacity, presence: :true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
