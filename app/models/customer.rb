class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  
  validates :name,:email,presence: true
  validates :password, length: { minimum: 6 }, on: :create 
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # フォローをした、されたの関係
  has_many :relationships,            class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :followings, through: :relationships,            source: :followed
  has_many :followers,  through: :reverse_of_relationships, source: :follower
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
   # フォローしたときの処理
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォローを外すときの処理
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end
  
  # ユーザー検索(部分検索)
  def self.looks(word)
    @customer = Customer.where("name LIKE?","%#{word}%")
  end
end
