class ConsultationService
  def initialize(params)
    @search = params[:search]
    @consultations = Consultation.all
  end

  def filter_proces
    find_by_search if @search.present?
     @consultations
  end

  def find_by_search
    @consultations = @consultations.where("title ilike :q OR history ilike :q OR exam ilike :q ", {q: "%#{@search.downcase}%"})
  end
end
