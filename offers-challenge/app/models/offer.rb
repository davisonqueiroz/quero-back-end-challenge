class Offer < ApplicationRecord
  validates :course_name, :rating, :full_price, :offered_price, :kind, :level, :ies_logo, :ies_name, presence: true
  validates :full_price, :offered_price, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  enum :kind, {
    presencial: 'presencial',
    ead: 'ead'  
  }
  enum :level, {
    tecnologo: 'tecnologo',
    licenciatura: 'licenciatura',
    bacharelado: 'bacharelado'
  } 
  validates :discount_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  before_validation :calculate_discount_percentage

  scope :by_kind, ->(kind) { where(kind: kind) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_interval_price, ->(min_price, max_price) { where(offered_price: min_price..max_price) }
  scope :by_course_name, ->(name) { where('course_name ILIKE ?', "%#{name}%") }
  scope :order_by_name, ->(direction) { order(course_name: direction) }
  scope :order_by_offered_price, ->(direction) { order(offered_price: direction) }
  scope :order_by_rating, ->(direction) { order(rating: direction) }

  private

  def calculate_discount_percentage
    self.discount_percentage = (self.full_price - self.offered_price) / self.full_price
  end

end
