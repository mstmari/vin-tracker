class User < ActiveRecord::Base
has_many :wines
has_secure_password

def self.validate_email
 unless validates_format_of :email, :with => /@/, :on => :create
 redirect '/signup'
end
end

end
