require 'algolia'
require 'json'

client = Algolia::Search::Client.create('LG58UB0A5R', '29cb07ffc76d1661e129ecbdf15ad8ac')

index = client.init_index('items')
batch = JSON.parse(File.read('data/items.json'))
index.save_objects(batch)

index.set_settings({
  searchableAttributes: [
    'name',
    'description',
    'brand'
  ],
  customRanking: [
    'desc(rating)',
    'desc(popularity)'
  ],
  attributesForFaceting: [
    'searchable(brand)',
    'type',
    'categories',
    'price'
  ]
})