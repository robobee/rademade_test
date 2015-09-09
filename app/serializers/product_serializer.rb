class ProductSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :alias_name, :price

end
