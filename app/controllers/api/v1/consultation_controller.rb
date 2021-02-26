class Api::V1::ConsultationController < ApplicationController
before_action :authenticate
before_action :set_consultation, except: [:create, :index]

  def index
   @pagy, @consultations = pagy(ConsultationService.new(params).filter_proces)
    render json: {consultations: @consultations.map{|item| ConsultationSerializer.new(item)},total_page: @pagy.page}
  end

  def create
   @consultation = Consultation.new(cons_params)
     if @consultation.save
       render json: {consultation: ConsultationSerializer.new(@consultation)}
     else
       render json: {errors: @consultation.errors.full_messages}
     end
  end

  def update
   authorize @consultation
     if @consultation.update(cons_update_params)
        render json: {consultation: ConsultationSerializer.new(@consultation)}
     else
        render json: {error_message: @consultation.errors.full_messages}
     end
  end

  def destroy
   authorize @consultation
    if @consultation.destroy
      render json: {message: "Consultation is deleted"}
    end
  end

  private

  def set_consultation
    @consultation = Consultation.find_by(id: params[:id])
    if @consultation.nil?
       render json: { error_message: "Not found"}
    end
  end

  def cons_params
    params.require(:consultation).permit( :disclaimer, :title, :history, :exam, :impression, :plan, :additional_info, :broshure).merge(user_id: @current_user.id)
  end

  def cons_update_params
    params.require(:consultation).permit( :disclaimer, :title, :history, :exam, :impression, :plan, :additional_info, :broshure)
  end
end
