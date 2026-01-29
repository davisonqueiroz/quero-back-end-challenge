class Offer < ApplicationRecord
  validates :course_name, :rating, :full_price, :offered_price, :kind, :level, :ies_logo, :ies_name, presence: true
  validates :full_price, :offered_price, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  enum kind: { presencial: 'presencial', ead: 'ead'  }
  enum level: { tecnologo: 'tecnologo', licenciatura: 'licenciatura', bacharelado: 'bacharelado' } 
  validates :discount_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
