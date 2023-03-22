class Article < ApplicationRecord
  belongs_to :customer
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 画像
  def get_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # ログインユーザーが記事にいいねしているかを判定する
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
  # # フォローしたときの処理
  # def follow(customer_id)
  #   relationships.create(followed_id: customer_id)
  # end
  # # フォローを外すときの処理
  # def unfollow(customer_id)
  #   relationships.find_by(followed_id: customer_id).destroy
  # end
  # # フォローしているか判定
  # def following?(customer)
  #   followings.include?(customer)
  # end
end
