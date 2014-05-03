class InsertSimilarities2 < ActiveRecord::Migration
  def change 
    Profile.all.each do |profile1|
      Profile.all.each do |profile2|
        if (profile1 != profile2)
          # insert similarity record for this profiles
	  sim = calc_similarity(profile1, profile2)
	  sim_model = Similarity.new
          sim_model.user1_id = profile1.userId.to_i
          sim_model.user2_id = profile2.userId.to_i
	  sim_model.similarity = sim
	  sim_model.save
        end
      end
    end
  end

  def calc_similarity(user1, user2)
    similarity = 1.0
    similarity_mod = 0.2

    # age
    if (user1.date_of_birth != nil and user2.date_of_birth != nil)
      age_diff = (user1.date_of_birth.year - user2.date_of_birth.year).abs
      if (age_diff >= 20)
        similarity -= similarity_mod
      elsif (age_diff <= 9)
        similarity += similarity_mod
      end
    end

    # gender
    if (user1.gender != nil and user2.gender != nil and user1.gender == user2.gender)
      similarity += similarity_mod
    end

    # marital status
    if (user1.marital_status != nil and user2.marital_status != nil and user1.marital_status == user2.marital_status)
      similarity += similarity_mod
    end

    # parental status
    if (user1.has_kids != nil and user2.has_kids != nil and user1.has_kids == user2.has_kids)
      similarity += similarity_mod
    end

    # home country
    if (user1.hometown_country != nil and user2.hometown_country != nil and user1.hometown_country == user2.hometown_country)
      similarity += similarity_mod
    end

    if (similarity < 0)
      similarity = 0
    end

    return similarity
  end
end
