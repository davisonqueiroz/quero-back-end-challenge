require 'json'

file_path = Rails.root.join('db', 'data.json')
file_data = File.read(file_path)
json = JSON.parse(file_data)
offers = json['offers']

offers.each do |offer|
  Offer.create!(
    course_name: offer['courseName'],
    rating: offer['rating'],
    full_price: offer['fullPrice'],
    offered_price: offer['offeredPrice'],
    kind: offer['kind'],
    level: offer['level'],
    ies_logo: offer['iesLogo'],
    ies_name: offer['iesName']
  )
end