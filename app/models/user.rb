class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :validatable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :email, :password, :password_confirmation, :username
  validates_uniqueness_of :username, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :timezone

  has_many :users_games_roles
  has_many :games, :through => :users_games_roles
  has_many :squadrons_ships
end
