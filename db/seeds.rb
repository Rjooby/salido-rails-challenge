require 'addressable/uri'
require 'rest-client'
require 'json'

# Arbitrarily large number to grab all products
LARGENUM = 80000

def get_wine_data(off)
  # API call for list of products
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'services.wine.com',
    path: 'api/beta2/service.svc/json/catalog',
    query_values: {
      offset: off,
      size: 400,
      apikey: "2990d8c762e8ff3ec9d2f1a2240425d0"


    }
  ).to_s

  json_data = RestClient.get(url)
  parsed_data = JSON.parse(json_data)
  list = []

  JSON.parse(RestClient.get(url))["Products"]["List"].each_with_index do |product, idx|
    list.push(product);
  end

  list
end

# Breaks up product list into packages of 400 to prevent wine.com server from timing out.

def get_all(num)
  wine_list = []
  i = 0

  while i < num
    wine_list.concat(get_wine_data(i))
    i += 400
  end

  wine_list
end
#
# puts get_all(400);

get_all(LARGENUM).each do |product|
  Product.create!(
    name: product["Name"],
    url: product["Url"],
    wine_id: product["Id"],
    price_min: product["PriceMin"],
    price_max: product["PriceMax"],
    price_retail: product["PriceRetail"],
    wine_type: (product["Varietal"]["Name"] if !product["Varietal"].nil?),
    vineyard: (product["Vineyard"]["Name"] if !product["Vineyard"].nil?),
    region: (product["Appellation"]["Region"]["Name"] if !product["Appellation"].nil?)
  )

end
