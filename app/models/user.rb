class User < ActiveRecord::Base
has_many :wines
has_secure_password

 def self.validate_email
  unless validates_format_of :email, :with => /@/
  redirect '/signup'
end
end
self.validate_email

end
