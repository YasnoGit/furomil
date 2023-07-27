# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン用
Admin.create!(
  email: 'admin@aaa',password: 'adminadmin')

# 会員情報
Customer.create!(
  [
    {email: 'aaa@aaa', last_name: '風呂', first_name: '好太郎', last_name_kana: 'ふろ', first_name_kana: 'こうたろう', post_code: '0000000', address: '東京都大田区', phone_number: '00000000000', is_deleted: 'false', created_at: '', updated_at: '', password: 'aaaaaa' },
    {email: 'bbb@bbb', last_name: '泉', first_name: '好子', last_name_kana: 'いずみ', first_name_kana: 'よしこ', post_code: '1111111', address: '神奈川県川崎市', phone_number: '11111111111', is_deleted: 'true', created_at: '', updated_at: '', password: 'bbbbbb' },
    {email: 'ccc@ccc', last_name: '暑居', first_name: '爽那', last_name_kana: 'あつい', first_name_kana: 'さうな', post_code: '2222222', address: '埼玉県熊谷市', phone_number: '22222222222', is_deleted: 'false', created_at: '', updated_at: '', password: 'cccccc' }
    # {email: 'james@example.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
  ]
)

# エリア情報
Area.create!(
  [
    {name: '東京都'},
    {name: '神奈川県'},
    {name: '埼玉県'},
    {name: '千葉県'},
    {name: '群馬県'},
    {name: '静岡県'}
  ]
)

# 施設情報
Facility.create!(
  [
    {area_id: '1', name: 'test温泉', introduction: 'testNo.1', price: '500', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '東京都大田区', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/温泉.jpg"), filename:"温泉.jpg")},
    {area_id: '2', name: 'test銭湯', introduction: 'testNo.2', price: '1150', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '神奈川県厚木市', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/銭湯.jpg"), filename:"銭湯.jpg")},
    {area_id: '3', name: 'testサウナ', introduction: 'testNo.3', price: '800', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '埼玉県越谷市', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/サウナ.jpg"), filename:"サウナ.jpg")},
    {area_id: '4', name: 'test岩盤浴', introduction: 'testNo.4', price: '1100', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '千葉県浦安市', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/岩盤浴.jpg"), filename:"岩盤浴.jpg")},
    {area_id: '1', name: 'test銭湯2', introduction: 'testNo.5', price: '1200', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '東京都世田谷区', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/岩盤浴.jpg"), filename:"銭湯2.jpg")},
    {area_id: '5', name: 'test温泉宿', introduction: 'testNo.6', price: '12200', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '群馬県吾妻郡草津町', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/温泉宿.jpg"), filename:"温泉宿.jpg")},
    {area_id: '6', name: 'test温泉宿2', introduction: 'testNo.7', price: '400', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '静岡県県伊東市', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/温泉宿2.jpg"), filename:"温泉宿2.jpg")},
    {area_id: '2', name: 'test銭湯3', introduction: 'testNo.8', price: '690', open: 'AM9:00～PM11:30', holiday: '毎週水曜日', address: '神奈川県小田原市', latitude: '', longitude: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/湯.jpg"), filename:"湯.jpg")}
  ]
)

# レビュー情報
Review.create!(
  [
    {customer_id: '1', facility_id: '1', comment: '良かったです', score: '4.0'},
    {customer_id: '2', facility_id: '1', comment: '普通', score: '2.0'},
    {customer_id: '2', facility_id: '2', comment: '良かったです', score: '5.0'},
    {customer_id: '3', facility_id: '2', comment: '普通', score: '2.0'},
    {customer_id: '3', facility_id: '3', comment: '良かったです', score: '3.0'},
    {customer_id: '1', facility_id: '3', comment: '普通', score: '2.0'},
    {customer_id: '1', facility_id: '4', comment: '良かったです', score: '4.0'},
    {customer_id: '2', facility_id: '4', comment: '普通', score: '4.0'},
    {customer_id: '2', facility_id: '5', comment: '良かったです', score: '5.0'},
    {customer_id: '3', facility_id: '5', comment: '普通', score: '2.0'},
    {customer_id: '3', facility_id: '6', comment: '良かったです', score: '4.0'},
    {customer_id: '1', facility_id: '6', comment: '普通', score: '3.0'},
    {customer_id: '1', facility_id: '7', comment: '良かったです', score: '5.0'},
    {customer_id: '2', facility_id: '7', comment: '普通', score: '1.0'},
    {customer_id: '2', facility_id: '8', comment: '良かったです', score: '4.0'},
    {customer_id: '3', facility_id: '8', comment: '普通', score: '3.0'}
  ]
)

# ブックマーク情報
Bookmark.create!(
  [
    {customer_id: '1', facility_id: '1'},
    {customer_id: '1', facility_id: '2'},
    {customer_id: '2', facility_id: '2'},
    {customer_id: '2', facility_id: '3'},
    {customer_id: '3', facility_id: '3'},
    {customer_id: '3', facility_id: '4'}
  ]
)