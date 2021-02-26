class ConsultationService
  def initialize(params)
    @search = params[:search]
    @name = params [:name]
    @consultations = Consultation.all
  end

  def filter_proces
    find_by_search if @search.present?
    find_by_name if @name.present?
     @consultations
  end

  def find_by_search
    @consultations = @consultations.where("title ilike :q OR history ilike :q OR exam ilike :q ", {q: "%#{@search.downcase}%"})
  end

  def find_by_name
    @consultations = @consultations.joins(:user).where("users.first_name ilike :g",{g: "%#{@name.downcase}%"})
  end
end
