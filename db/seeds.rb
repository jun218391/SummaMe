# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者用アカウント
Admin.create!(
    email: 'admin@email.com',
    password: 'SummaMe',
)

customers = Customer.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Article.create!(
  [
    {title: '読書のアウトプット',
    content: 'インプット3：アウトプット7の比率が記憶を最も定着させる。
    読書をする前にその本を読む目的や自分の抱えている課題を抜き出してみる。
    最初から最後まで全てを完璧に読もうとせずに重要な部分だけを抜き出してみる。
    日常生活の中で、本に書かれていることをどのように活かそうか考えながら読む
    本を読んだ目的を達成するために、取り組むことを書く。', 
    todo: 'SNSに本の感想を投稿してみる！',
    book_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), 
    customer_id: customers[0].id,
    is_published_flag: true},
    
    {title: 'ビジネスをより効果的にする最善の方法',
    content: '大人気のカフェです。', 
    todo: '大人気のカフェです。',
    book_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), 
    customer_id: customers[1].id,
    is_published_flag: true },
    
    {title: 'ShoreditchBar',
    content: '大人気のカフェです。', 
    todo: '大人気のカフェです。',
    book_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), 
    customer_id: customers[2].id,
    is_published_flag: true}
  ]
)
