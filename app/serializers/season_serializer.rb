class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :type

  has_many :episodes
  has_many :purchase_options
end
