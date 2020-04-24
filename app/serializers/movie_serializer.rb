class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :type

  has_many :purchase_options
end
