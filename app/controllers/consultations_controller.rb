class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def consultation_params
    params.require(:consultation).permit(:name, :address, :kontakt, :opening_hours, :image)
  end
end
