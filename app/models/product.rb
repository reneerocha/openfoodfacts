class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :code, type: String
  field :barcode, type: String
  field :status, type: String
  field :imported_t, type: Time
  field :url, type: String
  field :product_name, type: String
  field :quantity, type: String
  field :categories, type: String
  field :packaging, type: String
  field :brands, type: String
  field :image_url, type: String
end
