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

# テストデータ
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
    content: '仕事の全体像と目標を抑える。全体像から計画を立てタスクの優先順位を
    付ける。', 
    todo: '',
    book_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), 
    customer_id: customers[1].id,
    is_published_flag: true },
    
    {title: 'ShoreditchBar',
    content: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. 
    Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, 
    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, 
    pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, 
    fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, 
    venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. 
    Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, 
    consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,
    tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. 
    Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. 
    Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, 
    sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, 
    luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.
    Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. 
    ]Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. 
    Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 
    todo: 'vitae, eleifend ac, enim. Aliquam',
    book_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), 
    customer_id: customers[2].id,
    is_published_flag: true}
  ]
)
