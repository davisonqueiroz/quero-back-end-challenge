class OfferSerializer < ActiveModel::Serializer
  attributes :id, :ies_name, :ies_logo, :course_name, :refined_level, :refined_kind, :display_full_price, :display_offered_price, :display_discount_percentage, :rating

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
    "R$ #{object.offered_price}"
  end

  def display_full_price
    "R$ #{'%.2f' % object.full_price}".sub('.',',')
  end

  def display_discount_percentage
    "#{(object.discount_percentage * 100).round}%".sub('.',',')
  end

end
