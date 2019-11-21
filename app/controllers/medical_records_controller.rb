class MedicalRecordsController < ApplicationController
  
  def index
    @mrecords = MedicalRecord.all.page(params[:page]).per(10)
  end

  def new
    @mrecord = MedicalRecord.new
  end
  
  def show
    @mrecord = MedicalRecord.find(params[:id])
  end
end
