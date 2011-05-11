class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :validatable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_presence_of :email, :password, :password_confirmation, :username
  validates_uniqueness_of :username, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :timezone

  has_many :squadrons
  has_many :squadrons_ships
  has_many :side1_cinc, :class_name => "Game", :foreign_key => :side1_cinc
  has_many :side2_cinc, :class_name => "Game", :foreign_key => :side2_cinc
end
