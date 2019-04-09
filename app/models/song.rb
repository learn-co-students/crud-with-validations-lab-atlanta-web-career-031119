class Song < ApplicationRecord
    validates :title, presence: true
    validates_uniqueness_of :title, scope: :release_year 
    
    with_options if: :is_released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality:{
            less_than_or_equal_to: Date.today.year
        }
    end


    def is_released?
        released
    end
end
