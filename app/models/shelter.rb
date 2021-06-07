class Shelter < ActiveRecord::Base
    has_secure_password
    has_many :animals


    def last_added
        self.animals.last
    end

end