class ToDoListsController < ApplicationController
  before_action :set_to_do_list, only: [:show, :edit, :update, :destroy]

  # GET /to_do_lists
  # GET /to_do_lists.json
  def index
    @to_do_lists = ToDoList.all
  end

  # GET /to_do_lists/1
  # GET /to_do_lists/1.json
  def show
  end

  # GET /to_do_lists/new
  def new
    @to_do_list = ToDoList.new
  end

  # GET /to_do_lists/1/edit
  def edit
  end

  # POST /to_do_lists
  # POST /to_do_lists.json
  def create
    @to_do_list = ToDoList.new(to_do_list_params)

    respond_to do |format|
      if @to_do_list.save
        format.html { redirect_to @to_do_list, notice: 'To do list was successfully created.' }
        format.json { render :show, status: :created, location: @to_do_list }
      else
        format.html { render :new }
        format.json { render json: @to_do_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_do_lists/1
  # PATCH/PUT /to_do_lists/1.json
  def update
    respond_to do |format|
      if @to_do_list.update(to_do_list_params)
        format.html { redirect_to @to_do_list, notice: 'To do list was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_do_list }
      else
        format.html { render :edit }
        format.json { render json: @to_do_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_do_lists/1
  # DELETE /to_do_lists/1.json
  def destroy
    @to_do_list.destroy
    respond_to do |format|
      format.html { redirect_to to_do_lists_url, notice: 'To do list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do_list
      @to_do_list = ToDoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_do_list_params
      params.require(:to_do_list).permit(:title, :description)
    end
end
