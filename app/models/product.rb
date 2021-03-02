class Product < ApplicationRecord
  has_one_attached :photo

  has_many :reviews, dependent: :nullify
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by!(name: name).products
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  monetize :price_cents

  include PgSearch::Model
  pg_search_scope :search_by_full_name, against: [:name]
end
