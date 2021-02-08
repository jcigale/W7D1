# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}
    after_initialize :ensure_session_token
    

    attr_reader :password

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(@password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end




end
