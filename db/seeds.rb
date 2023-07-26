# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン用seed
Admin.create!(
  email: 'admin@aaa',
  password: 'adminadmin'
)

# 会員情報
customers = Customer.create!(
  [
    {email: 'olivia@example.com', last_name: '', first_name: '', last_name_kana: '', first_name_kana: '', post_code: '', address: '', phone_number: '', is_deleted: '', created_at: '', updated_at: '', password: 'password' },
    {email: 'james@example.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@example.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

# 施設情報
Facility.create!(
  [
    {area_id: '', name: '', introduction: '', price: '', open: '', holiday: '', score: '', address: '',, latitude: '', longitude: '', created_at: '', updated_at: '' },
    {shop_name: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '大人気のカフェです。', user_id: users[0].id },
    {shop_name: '和食屋せん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '日本料理は美しい！', user_id: users[1].id },
    {shop_name: 'ShoreditchBar', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'メキシコ料理好きな方にオススメ！', user_id: users[2].id }
  ]
)

# エリア情報
Area.create!(
  [
    {name: '', created_at: '', updated_at: '' },
  ]
)

# レビュー情報
Review.create!(
  [
    {customer_id: '', facility_id: '', comment: '', score: '', created_at: '', updated_at: '' },
  ]
)

# ブックマーク情報
Bookmark.create!(
  [
    {customer_id: '', facility_id: '', created_at: '', updated_at: '' },
  ]
)

