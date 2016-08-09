class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
         
  validates :username, presence: true, uniqueness: true,
            length: {in: 3..20, too_short: "Debes tener al menos 3 caracteres", too_long: "Puedes tener máximo 20 caracteres"},
            format: {with: /([A-Za-z0-9\-\_]+)/, message: "Tu usuario solo puede contener letras, numeros y guiones"}


  has_many :friendships, foreign_key: "usuario_id", dependent: :destroy
  has_many :follows, through: :friendships, source: :friend
  has_many :followers_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :followers, through: :followers_friendships, source: :usuario

  has_many :payments

  def follow!(amigo_id)
    self.friendships.create!(friend_id: amigo_id)
  end
  
  #Para no seguir una persona dos veces y no seguirme yo mismo
  def can_follow?(amigo_id)
    not amigo_id == self.id or friendships.where(friend_id: amigo_id).size > 0
  end


end