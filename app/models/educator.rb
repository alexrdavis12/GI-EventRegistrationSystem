class Educator < ActiveRecord::Base
   belongs_to :user, counter_cache: true
   
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  PHONE_REGEX = /\d{3}\d{3}\d{4}/
  
  validates :edgaurdianemail, :if => lambda {:edschooltype == "Home School"}, :format => EMAIL_REGEX
  validates :edprimaryemail, :presence => true, :format => EMAIL_REGEX
  validates :edprincipleemail, :if => lambda {:edschooltype == "Private School"}, :format => EMAIL_REGEX
  validates :edpgaurdianphone, :if => lambda {:edschooltype == "Home School"}, :format => PHONE_REGEX
  validates :edprimaryphone, :presence =>true, :format => PHONE_REGEX
end
