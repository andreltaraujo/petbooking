class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end
  
  def new
    @pet = Pet.new
    @kind_options = Kind.all
  end
  
  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to welcome_index_path, notice: 'Pet successfuly created!'
    else
      render :new
    end
  end

  def show
  end

  def edit
    @kind_options = Kind.all
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id), notice: 'Pet successfuly updated!'
    else
      render :edit
    end
  end
  def destroy
    if @pet.destroy
      redirect_to pets_path, notice: 'Pet successfuly deleted!'
    else
      render :index
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:id, :name, :birthdate, :breed, :kind_id)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
