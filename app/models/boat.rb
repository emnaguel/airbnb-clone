class Boat < ApplicationRecord
  belongs_to :user
  CATEGORIES = ['Sailboat', 'Motorboat', 'Catamaran', 'Jet ski', 'Houseboat']
end
