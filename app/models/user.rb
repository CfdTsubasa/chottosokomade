class User < ApplicationRecord
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :current_location, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower, dependent: :destroy
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(name: 'ゲスト',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  def following_users_spots
    following_ids = "SELECT followed_id FROM relationships
                    WHERE follower_id = :user_id"
    Spot.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id).order(id: "DESC")
  end

  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
end
