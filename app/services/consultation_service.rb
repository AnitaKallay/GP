class ConsultationService
  def initialize(params)
    @search = params[:search]
    @consultations = Consultation.all
  end

  def filter_proces
    if @search.present?;find_by_search
    end
     @consultations
  end

  def find_by_search
    @consultations = @consultations.where("title ilike :q OR history ilike :q OR exam ilike :q ", {q: "%#{@search.downcase}%"})
  end
end
