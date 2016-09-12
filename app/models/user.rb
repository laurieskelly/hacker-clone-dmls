class User < ActiveRecord::Base
  has_many :articles
  has_many :comments


  validate :check_password_length
    def password
      @password ||= BCrypt::Password.new(password_hash)
    end

    def password=(new_password)
      @plaintext_password = new_password
      @password = BCrypt::Password.create(new_password)
      self.password_hash = @password
    end

    def authenticate(input_password)
      self.password == input_password
    end

    def check_password_length
      if new_password.length < 6
        errors.add(:password, "must be greater than 6 characters")
      end
    end
end
