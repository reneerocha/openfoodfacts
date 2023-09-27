class ProductsSpider < Kimurai::Base
  @name = 'products_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//ul[@class='products']//li/a").each do |a|
      request_to :parse_repo_page, url: absolute_url(a[:href], base: url)
    end

    if next_page = response.at_xpath("//a[@class='next_page']")
      request_to :parse, url: absolute_url(next_page[:href], base: url)
    end
  end

  def parse_repo_page(response, url:, data: {})
    item = {}
    item[:code] = response.xpath("//span[@id='barcode']").text
    item[:barcode] = response.xpath("//p[@id='barcode_paragraph']").text.strip.remove('Barcode:  ')
    item[:url] = url
    item[:product_name] = response.xpath("//h1[@class='title-3']").text.strip
    item[:quantity] = response.xpath("//span[@id='field_quantity_value']").text
    item[:categories] = response.xpath("//span[@id='field_categories_value']").text
    item[:packaging] = response.xpath("//span[@id='field_packaging_value']").text
    item[:brands] = response.xpath("//span[@id='field_brands_value']").text
    item[:image_url] = response.xpath("//img[@class='product_image']").map { |img| p img.attr('src') }.first
    item[:imported_t] = Time.now.utc.to_formatted_s(:number)
    item[:status] = 'imported'

    product = Product.find_or_initialize_by(code: item[:code])
    product.attributes = item

    begin 
      product.save
    rescue StandardError => error
      Rails.logger.error(error)
    end
    
  end
end