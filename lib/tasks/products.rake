namespace :products do
  desc "scraping Open Food Facts"
  task crawler: :environment do
    url = 'https://world.openfoodfacts.org/'
    ProductsSpider.process(url)
  end
end
