class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      message: "no es una dirección de correo electrónico válida"
    }

    validates :username, presence: true, uniqueness: true,
     length: { in: 4..10 }, 
     format: {
        with: /\A[a-z-0-9-A-Z]+\z/, 
        message: :invalid
     } 
    validates :password, length: { minimum: 6}

    before_save :downcase_attributes

     private

     def downcase_attributes
        self.username = username.downcase
        self.email = email.downcase
     end



end
