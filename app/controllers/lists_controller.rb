class ListsController < ApplicationController

  before_action :set_list, only: ['index']
  before_action :set_bookmark, only: ['show']

  # Display all lists
  def index
    @lists = List.all
  end

  # Display a single list
  def show
    @list = List.find(params[:id])
  end

  # Create a new list
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @lists = List.all
    if @list.save
      redirect_to list_path(@list)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.new
  end

  def set_bookmark
    @bookmark = Bookmark.new
  end
end
