class ListsController < ApplicationController
  #before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]


  def index
  end

  def new
    @list_form = ListForm.new
  end

  def create
    binding.pry
    @list_form = ListForm.new(list_form_params)
    if @list_form.valid? 
      @list_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_form_params
    params.require(:list_form).permit(:content, :quantity).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
