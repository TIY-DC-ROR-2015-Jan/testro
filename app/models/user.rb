class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :favorites
  has_many :favorite_metros, through: :favorites, source: :metro

  def add_favorite_metro m
    # favories.where(metro: m).first_or_create!
    favorite_metros.push m unless favorite_metros.include? m
  end
end
