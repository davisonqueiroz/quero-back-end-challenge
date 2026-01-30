class OfferSerializer < ActiveModel::Serializer
  attributes :id, :ies_name, :ies_logo, :course_name
  attribute :refined_level, key: :level
  attribute :refined_kind, key: :kind
  attribute :display_full_price, key: :fullPrice
  attribute :display_offered_price, key: :offeredPrice
  attribute :display_discount_percentage, key: :discountPercentage
  attributes :rating

  LEVELS = {
    'tecnologo' => 'Tecnólogo (graduação)',
    'licenciatura' => 'Licenciatura (graduação)',
    'bacharelado' => 'Bacharelado (graduação)'
  }.freeze

  KINDS = {
    'presencial' => 'Presencial',
    'ead' => 'EaD'
  }.freeze

  def refined_level
    LEVELS[object.level]
  end

  def refined_kind
    KINDS[object.kind]
  end

  def display_offered_price
    "R$ #{object.offered_price}".sub('.',',')
  end

  def display_full_price
    "R$ #{'%.2f' % object.full_price}".sub('.',',')
  end

  def display_discount_percentage
    "#{(object.discount_percentage * 100).round}%"
  end

end
