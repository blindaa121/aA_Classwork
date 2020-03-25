class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: {message: "Password cannot be blank"}
    validates :session_token, presence: true, uniqueness: true

    attr_reader :password

    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        # SecureRandom::UrlSafeBase64
        self.session_token = User.generate_session_token
        self.save!
        return self.session_token
    end

    def password=(pass) #set our own password setter method because we don't have a column
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end

    def is_password?(pass) 
        self.password_digest == BCrypt::Password.create(pass)
    end

    def self.find_by_credentials(user, pass)
        user = User.find_by(user_name: user)
        if user && is_password?(pass)
            return user
        else
            return nil
        end
    end
end
