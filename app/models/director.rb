# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Director < ApplicationRecord
  def filmography
    my_id = self.id

    matching_movies = Movie.where({ :director_id => my_id })

    sorted_movies = matching_movies.order({ :year => :asc })

    return sorted_movies
  end

  # Three 1-N associations:
  # - Director => Movie
  # - Movie => Character
  # - Actor => Character

  # Try define:
  #   - Director#filmography done
  #   - Movie#director done
  #   - Movie#characters done
  #   - Character#movie done
  #   - Actor#characters done
  #   - Character#actor
end
