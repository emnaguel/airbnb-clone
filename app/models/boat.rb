class Boat < ApplicationRecord
  belongs_to :user
  CATEGORIES = ['bateau1', 'bateau2']
end
