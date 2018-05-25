class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :reviews, dependent: :destroy
  has_one :owner, through: :boat
  validates :user, presence: :true
  validates :boat, presence: :true
  validates :start_date, presence: :true
  validates :end_date, presence: :true
  validates :total_price, presence: :true


  include PgSearch
  pg_search_scope :global_search,
    against: [ :start_date, :end_date ],
    associated_against: {
      boat: [ :category, :address ]
    },
    using: {
      tsearch: { prefix: true }
    }
  end
