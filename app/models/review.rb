class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  RATES = ['1', '2', '3', '4', '5']
end
