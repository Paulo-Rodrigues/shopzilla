puts 'seeding everything'

CATEGORIES_NUMBER = 10
PRODUCTS_NUMBER = 100
PRODUCT_VARIANTS_NUMBER = 100
PRODUCT_BUNDLES_NUMBER = 10
PRODUCT_BUNDLE_ITEMS_NUMBER = 10
TAGS_NUMBER = 10
PRODUCT_TAGS_NUMBER = 10
VENDORS_NUMBER = 50
USERS_NUMBER = 200
REVIEWS_NUMBER = 1000
WISHLISTS_NUMBER = 100
WISHLIST_ITEMS_NUMBER = 100
COUPONS_NUMBER = 10
SHIPPING_ZONES_NUMBER = 10
SHIPPINGS_NUMBER = 100
ORDERS_NUMBER = 100
ORDER_ITEMS_NUMBER = 100
INVENTORIES_NUMBER = 100
PAYMENTS_NUMBER = 100
INVOICES_NUMBER = 100
LOGS_NUMBER = 100

puts 'seeding categories'
CATEGORIES_NUMBER.times do
  Category.create(name: Faker::Commerce.department)
end

puts 'seeding products'
PRODUCTS_NUMBER.times do
  Product.create(
    vendor_id: rand(1..VENDORS_NUMBER),
    category_id: rand(1..CATEGORIES_NUMBER),
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    stock: rand(1..100)
  )
end

puts 'seeding product variants'
PRODUCT_VARIANTS_NUMBER.times do
  ProductVariant.create(
    product_id: rand(1..PRODUCTS_NUMBER),
    variant_type: Faker::Commerce.material,
    variant_value: Faker::Commerce.color,
    stock: rand(1..100)
  )
end

puts 'seeding product bundles'
PRODUCT_BUNDLES_NUMBER.times do
  ProductBundle.create(
    name: Faker::Commerce.product_name,
    discount_value: Faker::Commerce.price,
    discount_type: rand(0..1)
  )
end

puts 'seeding product bundle items'
PRODUCT_BUNDLE_ITEMS_NUMBER.times do
  ProductBundleItem.create(
    product_bundle_id: rand(1..PRODUCT_BUNDLES_NUMBER),
    product_id: rand(1..PRODUCTS_NUMBER)
  )
end

puts 'seeding tags'
TAGS_NUMBER.times do
  Tag.create(name: Faker::Commerce.material)
end

puts 'seeding product tags'
PRODUCT_TAGS_NUMBER.times do
  ProductTag.create(
    product_id: rand(1..PRODUCTS_NUMBER),
    tag_id: rand(1..TAGS_NUMBER)
  )
end

puts 'seeding vendors'
VENDORS_NUMBER.times do
  Vendor.create(
    user_id: rand(1..USERS_NUMBER),
    rating: rand(1..5),
    sales_count: rand(1..100)
  )
end

puts 'seeding users'
USERS_NUMBER.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    role: rand(0..1)
  )
end

puts 'seeding reviews'
REVIEWS_NUMBER.times do
  Review.create(
    user_id: rand(1..USERS_NUMBER),
    product_id: rand(1..PRODUCTS_NUMBER),
    rating: rand(1..5),
    content: Faker::Lorem.paragraph
  )
end

puts 'seeding wishlists'
WISHLISTS_NUMBER.times do
  Wishlist.create(
    user_id: rand(1..USERS_NUMBER),
    name: Faker::Commerce.department
  )
end

puts 'seeding wishlist items'
WISHLIST_ITEMS_NUMBER.times do
  WishlistItem.create(
    wishlist_id: rand(1..WISHLISTS_NUMBER),
    product_id: rand(1..PRODUCTS_NUMBER)
  )
end

puts 'seeding coupons'
COUPONS_NUMBER.times do
  Coupon.create(
    code: Faker::Commerce.promotion_code,
    discount_type: rand(0..1),
    discount_value: Faker::Commerce.price,
    expires_at: Faker::Date.forward(days: 365),
    usage_limit: rand(1..100)
  )
end

puts 'seeding shipping zones'
SHIPPING_ZONES_NUMBER.times do
  ShippingZone.create(
    name: Faker::Address.state,
    rate: Faker::Commerce.price
  )
end

puts 'seeding shippings'
SHIPPINGS_NUMBER.times do
  Shipping.create(
    order_id: rand(1..ORDERS_NUMBER),
    shipping_zone_id: rand(1..SHIPPING_ZONES_NUMBER),
    method: Faker::Commerce.product_name,
    rate: Faker::Commerce.price
  )
end

puts 'seeding orders'
ORDERS_NUMBER.times do
  Order.create(
    user_id: rand(1..USERS_NUMBER),
    status: rand(0..3),
    total: Faker::Commerce.price,
    payment_status: rand(0..3)
  )
end

puts 'seeding order items'
ORDER_ITEMS_NUMBER.times do
  OrderItem.create(
    order_id: rand(1..ORDERS_NUMBER),
    product_variant_id: rand(1..PRODUCT_VARIANTS_NUMBER),
    quantity: rand(1..10),
    price: Faker::Commerce.price
  )
end

puts 'seeding inventories'
INVENTORIES_NUMBER.times do
  Inventory.create(
    product_variant_id: rand(1..PRODUCT_VARIANTS_NUMBER),
    quantity: rand(1..100),
    reserved: rand(1..100)
  )
end

puts 'seeding payments'
PAYMENTS_NUMBER.times do
  Payment.create(
    order_id: rand(1..ORDERS_NUMBER),
    amount: Faker::Commerce.price,
    status: rand(0..3),
    payment_date: Faker::Date.between(from: 1.year.ago, to: Date.today)
  )
end

puts 'seeding invoices'
INVOICES_NUMBER.times do
  Invoice.create(
    order_id: rand(1..ORDERS_NUMBER),
    due_date: Faker::Date.forward(days: 365),
    total: Faker::Commerce.price,
    status: rand(0..3)
  )
end

# puts 'seeding logs'
# LOGS_NUMBER.times do
#   Log.create(
#     user_id: rand(1..USERS_NUMBER),
#     action: Faker::Lorem.word,
#     loggable_type: Faker::Lorem.word,
#     loggable_id: rand(1..PRODUCTS_NUMBER),
#     details: Faker::Lorem.paragraph
#   )
# end

puts 'seeding done'
