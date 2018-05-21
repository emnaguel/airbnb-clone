class Boat < ApplicationRecord
  belongs_to :user

  def self.categories
    ['bateau1', 'bateau2']
  end
end
