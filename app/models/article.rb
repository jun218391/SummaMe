class Article < ApplicationRecord
  belongs_to :customer
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 公開・非公開機能
  scope :published, -> {where(is_published_flag: true)}
  scope :unpublished, -> {where(is_published_flag: false)}
 
  # 画像
  def get_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # ログインユーザーが記事にいいねしているかを判定
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
  # 投稿検索（部分検索）
  def self.looks(word)
    @article = Article.where("title LIKE?","%#{word}%")
  end
end
