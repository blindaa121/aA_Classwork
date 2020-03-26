class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true 

    attr_reader :password #reader method for password
    after_initialize :ensure_session_token #use a callback to set the session_token before validation if it's not present
    
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token 
        SecureRandom::urlsafe_base64
    end 

    def reset_session_token! 
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end 

    def ensure_session_token 
        self.session_token ||= User.generate_session_token
    end 

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password) #password setter method, required since this is not a part of the db
        @password = password  # Create a new instance variable, @password, to use for validation later
        self.password_digest = BCrypt::Password.create(password)  # Use the built in setter for password digest (ActiveRecord) to assign the hash
    end

end
