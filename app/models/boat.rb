class Boat < ApplicationRecord
  belongs_to :user
  CATEGORIES = ['Sailboat', 'Motorboat', 'Catamaran', 'Jet ski', 'Houseboat']
  validates :name, presence: :true
  validates :address, presence: :true
  validates :description, presence: :true

  validates :price, presence: :true
  validates :model, presence: :true
  validates :capacity, presence: :true

end



