class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :show]
  before_action :set_list, only: [:edit, :update, :show]
  before_action :move_to_index, except: [:index, :show]


  def index
    @lists = List.all
    @categories = Category.all
    @category_lists = CategoryList.all
  end

  def new
    @list_form = ListForm.new
  end

  def create
    @list_form = ListForm.new(list_form_params)
    if @list_form.valid? 
      @list_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    list_attributes = @list.attributes
    @list_form = ListForm.new(list_attributes)
    @list_form.tag_name = @list.categories.first&.tag_name
  end

  def update
    @list_form = ListForm.new(list_form_params)
    if @list_form.valid?
      @list_form.update(list_form_params, @list)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    list = List.find(params[:id])
    if current_user.id == list.user_id
      list.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def search
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true)
  end

  private

  def list_form_params
    params.require(:list_form).permit(:content, :quantity, :tag_name).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
