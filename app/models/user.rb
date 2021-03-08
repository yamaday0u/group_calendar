class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :user_calendars
  has_many :calendars, through: :user_calendars

  with_options presence: true do
    validates :name

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'must include at least one half-width English character and a number', on: :create # validate only users/registrations#create
  end
end
