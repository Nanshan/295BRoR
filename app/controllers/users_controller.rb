class UsersController < ApplicationController

  # exposed for ease of testing only
  def index
    @users = User.order("id").page(params[:page]).per(50)        
  end

  # for showing user profile data
  def show
    @user = User.where(["lower(\"userName\") = ?", params[:name].downcase]).first
    @profile = Profile.where(["\"userId\" = ?", @user.id.to_s]).first
  end

  def login
    @result = false
    @user = User.where(["lower(\"userName\") = ?", params[:userName].downcase]).first
    if (@user != nil and @user.password == params[:password])
      @result = true
      
      # update the similarities for this user upon login, needs to be adjusted
      
    end
  end

  def register
    @result = false
    @existingUser = User.where(["lower(\"userName\") = ?", params[:userName].downcase]).first
    if (@existingUser == nil)
      @user = User.new
      @user.userName = params[:userName].downcase
      @user.password = params[:password]
      @user.email = params[:email].downcase
      if (@user.save)
        @result = true

	      # create profile
	      @profile = Profile.new
	      @profile.userId = @user.id
	      @profile.email = @user.email
	      @profile.save

	      # create similarity records (bidirectional)
	      Profile.all.each do |profile2|
          sim = calc_similarity(@profile, profile2)
	        sim_model = Similarity.new
            sim_model.user1_id = @user.id
            sim_model.user2_id = profile2.userId.to_i
            sim_model.similarity = sim
            sim_model.save
	        #sim_model2 = Similarity.new
          #  sim_model2.user2_id = @user.id
          #  sim_model2.user1_id = profile2.userId.to_i
          #  sim_model2.similarity = sim
          #  sim_model2.save
        end
      end
    end
  end

  def calc_similarity(user1, user2)
    similarity = 1.0
    similarity_mod = 0.2

    # age (date_of_birth)
    if (user1.date_of_birth != nil and user2.date_of_birth != nil)
      age_diff = (user1.date_of_birth.year - user2.date_of_birth.year).abs
      if (age_diff <= 9)
        similarity += similarity_mod
      elsif (age_diff > 9 and age_diff <= 19)
        similarity = similarity - (similarity_mod * 1)
      elsif (age_diff > 19 and age_diff <= 29)
        similarity = similarity - (similarity_mod * 2)
      elsif (age_diff > 29 and age_diff <= 39)
        similarity = similarity - (similarity_mod * 3)
      elsif (age_diff > 39 and age_diff <= 49)
        similarity = similarity - (similarity_mod * 4)
      elsif (age_diff > 49 and age_diff <= 59)
        similarity = similarity - (similarity_mod * 5)
      elsif (age_diff > 59 and age_diff <= 69)
        similarity = similarity - (similarity_mod * 6)
      elsif (age_diff > 69 and age_diff <= 79)
        similarity = similarity - (similarity_mod * 7)
      elsif (age_diff > 79 and age_diff <= 89)
        similarity = similarity - (similarity_mod * 8)
      elsif (age_diff > 89 and age_diff <= 99)
        similarity = similarity - (similarity_mod * 9)
      end
    end

    # gender
    if (user1.gender != nil and user2.gender != nil and user1.gender == user2.gender)
      similarity += similarity_mod
    else
      similarity -= similarity_mod  
    end

    # marital_status
    if (user1.marital_status != nil and user2.marital_status != nil and user1.marital_status == user2.marital_status)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end

    # current_location
    if (user1.current_location != nil and user2.current_location != nil and user1.current_location == user2.current_location)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end
    
    # hometown_city
    if (user1.hometown_city != nil and user2.hometown_city != nil and user1.hometown_city == user2.hometown_city)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end
    
    # hometown_state
    if (user1.hometown_state != nil and user2.hometown_state != nil and user1.hometown_state == user2.hometown_state)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end
    
    # hometown_country
    if (user1.hometown_country != nil and user2.hometown_country != nil and user1.hometown_country == user2.hometown_country)
      similarity += similarity_mod
    end
    
    # education_level
    if (user1.education_level != nil and user2.education_level != nil and user1.education_level == user2.education_level)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end

    # parental status (has_kids)
    if (user1.has_kids != nil and user2.has_kids != nil and user1.has_kids == user2.has_kids)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end

    # number_of_kids
    if (user1.number_of_kids != nil and user2.number_of_kids != nil and user1.number_of_kids == user2.number_of_kids)
      similarity += similarity_mod
    else
      similarity -= similarity_mod
    end
    
    # twitter user (number_of_tweets & number_of_followers)
    # need to add aditional logic for twitter related data

    #if (similarity < 0)
    #  similarity = 0
    #end

    return similarity
  end

end
