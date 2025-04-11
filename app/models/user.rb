class User <ApplicationRecord
    has_many :posts
    validates :name, presence:true, length:{ minimum: 5,maximum: 20}
    validates :email, presence:true, length:{ maximum: 100}, 
              uniqueness:true,format:{with: /\A\w+\.\d+@osu\.edu\Z/i }
    validates :password, presence:true, 
              length:{minimum:3}
    has_secure_password
end