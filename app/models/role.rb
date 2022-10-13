class Role < ActiveRecord::Base
    has_many :auditions
    has_many :actors, through: :auditions
    
    def actors
        array = []
        self.auditions.each do |aud|
            array <<  aud.actor
        end
        array
    end

    def locations
        array = []
        self.auditions.each do |aud|
            array << aud.location
        end
        array
    end

    def lead
        hired = self.auditions.find do |a| 
                 a[:hired] == true 
            end 
        if hired
             hired
        else
            'no actor has been hired for this role'
        end
    end
 
    def understudy
        hired_actors = self.auditions.find_all do |a|
            a[:hired] == true
        end
        if hired_actors.count > 1
            hired_actors[1]
        else
            'no actor has been hired for understudy for this role'
        end
    end

end