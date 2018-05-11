class User < ActiveRecord::Base
has_many :wines
has_secure_password
validates_format_of :email, :with => /@/



  validates :username,  :presence => true,
                        :uniqueness => true



end
