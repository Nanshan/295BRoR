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
	  sim_model2 = Similarity.new
          sim_model2.user2_id = @user.id
          sim_model2.user1_id = profile2.userId.to_i
          sim_model2.similarity = sim
          sim_model2.save
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
