class OfferSerializer < ActiveModel::Serializer
  attributes :id, :ies_name, :ies_logo, :course_name, :refined_level, :refined_kind
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
    LEVELS[self.level]
  end

  def refined_kind
    KINDS[self.kind]
  end

end
