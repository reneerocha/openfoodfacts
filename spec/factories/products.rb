FactoryBot.define do
  factory :product do
    code { Faker::Barcode.ean(13) }
    barcode { Faker::Barcode.ean_with_composite_symbology(13) }
    status { "imported" }
    imported_t { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    url { Faker::Internet.url(host: 'example.com') }
    product_name { Faker::Lorem.sentence(word_count: 8) }
    quantity { Faker::Measurement.metric_weight }
    categories { Faker::Lorem.sentence(word_count: 8)}
    packaging { Faker::Lorem.sentence(word_count: 8) }
    brands { Faker::Lorem.sentence(word_count: 8) }
    image_url { Faker::Internet.url(host: 'example.com', path: '/apple.jpg') }
  end
end
