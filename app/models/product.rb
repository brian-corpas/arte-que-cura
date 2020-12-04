class Product < ApplicationRecord
  has_one_attached :photo

  has_many :reviews, dependent: :nullify

  monetize :price_cents

  include PgSearch
  pg_search_scope :search_by_full_name, against: [:name]
end
