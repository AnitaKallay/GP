class UsersService

  def initialize(params)
    @user_types = params[:user_types]
    @county = params[:county]
    @search = params[:search]
    @users = User.all
  end

  def filter_proces
    if @user_types.present?
      find_by_user_types
    end

    if @county.present?
      find_by_county
    end

    if @search.present?
      find_by_qyery_search
    end
     @users
  end

  def  find_by_user_types
      @users = @users.where(user_types:@user_types)
  end

  def find_by_qyery_search
    @users = @users.where("last_name ilike :q OR first_name ilike :q OR email ilike :q ", {q: "%#{@search.downcase}%"})
  end


  def find_by_county
    @users = @users.where(county:@county)
  end
end
