class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :microposts, dependent: :destroy
  before_save :create_remember_token

  validates :name , presence:true,length:{maximum:50}
  validates :email, presence:true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness:{case_sensitive:false}
  validates :password, presence:true,length:{minimum:6}
  validates :password_confirmation, presence:true

  before_save do|user|
    user.email = email.downcase
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end

  private

  def create_remember_token
    # Create the token.
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
