class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :number, :title, :plot
end
