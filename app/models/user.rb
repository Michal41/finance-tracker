class User < ApplicationRecord
	has_many :user_stock
	has_many :stocks, through: :user_stock


  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :friends, through: :followed_users


  has_many :following_users, foreign_key: :friend_id, class_name: 'Follow'
  has_many :followers, through: :following_users



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def under_stock_limit?
  	stocks.count < 10
  end

  def cant_follow_friend?(friend)
    if friends.ids.include?(friend.id)
      return true
    end
    return false
  end

  def stock_already_tracked?(ticker_symbol)
  	stock = Stock.check_db(ticker_symbol)
  	return false unless stock
  	stocks.where(id: stock.id).exists?


  end

  def can_track_stock?(ticker_symbol)
  	under_stock_limit? && !stock_already_tracked?(ticker_symbol)

  end

  def full_name
    return "#{first_name} #{last_name}" if first_name|| last_name
    "Anonymous"

  end 

  def self.search(param)
    param.strip!
    to_send_back = (matches("first_name",param) + 
      matches("last_name",param) + 
      matches("email",param)).uniq
    return nil unless to_send_back
    to_send_back

  end

  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end

  def except_current_user(users)
    users.reject{|user| user.id==self.id}
  end


end
