class MarksController < ApplicationController
  before_action :set_mark, only: %i[ show edit update destroy ]

  # GET /marks or /marks.json
  def index
    @marks = Mark.includes(:category, :type)
    @mark = Mark.new
    @types = Type.all
    @categories = Category.all
    @group_by_types = Type.joins(:marks).group(:url).count
  end

  # GET /marks/1 or /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
  end

  # GET /marks/1/edit
  def edit
    @types = Type.all
    @categories = Category.all
  end

  # POST /marks or /marks.json
  def create
    @marks = Mark.all
    @mark = Mark.new(mark_params)

    unless @mark.save
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /marks/1 or /marks/1.json
  def update
    @mark.update(mark_params)
  end

  # DELETE /marks/1 or /marks/1.json
  def destroy
    @mark.destroy

    respond_to do |format|
      format.html { redirect_to marks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mark_params
      params.require(:mark).permit(:url, :category_id, :type_id, :sub_category)
    end
end
