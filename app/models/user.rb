class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  validates_presence_of :name
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  has_many :article_users, dependent: :destroy
  has_many :feeds, through: :article_users
  has_many :active_relationships, :class_name => "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :following, through: :active_relationships, :source => "followed"
  has_many :passive_relationships, :class_name => "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower, through: :passive_relationships, :source => "follower"
  has_many :likes
  has_many :comments
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by_followed_id(other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def like?(article)
    likes.pluck(:feed_id).include? article.id
  end

  def like(article)
    likes.create(:user_id => self.id, :feed_id => article.id)
  end

  def unlike(article)
    likes.where(:user_id => self.id, :feed_id => article.id).first.destroy
  end

  def comment post, content
    comments.create(:feed_id => post.id, :content => content)
  end
end
