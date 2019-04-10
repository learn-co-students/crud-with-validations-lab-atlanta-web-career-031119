class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: %i[release_year artist_name], message: "Can't have more than one song with the same name in the same year." }
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true

    # validates :release_year, unless: :released, presence: true, numericality: { less_than_or_equal_to: Time.now.year }

    # validates :check_release_year
    # def check_release_year        
    #     if @song.released == true
    #         @song.validates :release_year, presence: true
    #         @song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
    #     end
    # end

    #  Putting in solution code
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year
        }
    end
    
    def released?
    released
    end

end
