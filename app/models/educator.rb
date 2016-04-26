class Educator < ActiveRecord::Base
   belongs_to :user, counter_cache: true
   
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :edgaurdianemail, :if => lambda {:edschooltype == "Home School"}, :format => EMAIL_REGEX
  validates :edprimaryemail, :presence => true, :format => EMAIL_REGEX
  validates :edprincipleemail, :if => lambda {:edschooltype == "Private School"}, :format => EMAIL_REGEX
  
end
