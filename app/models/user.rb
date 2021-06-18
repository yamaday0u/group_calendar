class User < ApplicationRecord
  # Include default devise modules.
  # devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable,
  #         :confirmable, :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  include DeviseTokenAuth::Concerns::User
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  after_create :send_confirmation_email, if: -> { !Rails.env.test? && User.devise_modules.include?(:confirmable) }

  # Associations
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :calendar_for_groups
  has_many :chats
  has_many :calendars
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :mate_chats
  has_many :group_calendar_chats
  has_many :calendar_for_groups, through: :group_calendar_chats
  has_many :sns_credentials
  has_one_attached :user_image

  # user who is following others (active relationship)
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed

  # user who is followed by others (passive relationship)
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # Methods
  # To follow other user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # To unfollow other user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # If current user follows other user, return "true"
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  # Get mates
  def matchers
    followings & followers
  end

  # If current user is already mate with other user, return "true"
  def matchers?(other_user)
    active_relationships.find_by(followed_id: other_user.id) && passive_relationships.find_by(follower_id: other_user.id)
  end

  # If current user is followed by other user & doesn't follow that user, return "true"
  def follow_request?(user, other_user)
    !user.matchers?(other_user) && other_user.following?(user)
  end

  # Log in as a guest user
  def self.guest
    find_or_create_by!(email: 'guest@guest.mail') do |user|
      user.name = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64 + '1'
      user.identity = 'アプリ試用のためのアカウントです。'
      user.user_image.attach(io: File.open('public/penguin-161387_640.png'), filename: 'geust.png')
    end
  end

  # Validation
  with_options presence: true do
    validates :name

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'must include at least one half-width English character and a number', on: :create # validate only users/registrations#create
  end
  
  private
  def send_confirmation_email
    self.send_confirmation_instructions
  end
end
