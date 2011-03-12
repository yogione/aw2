class Token < ActiveRecord::Base
  belongs_to :user

  def self.generate_token_for_user(user)
    token = Token.new
    token.token = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
    token.user_id = user.id
    token.save
    token
  end

end
