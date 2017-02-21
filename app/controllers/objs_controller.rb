class ObjsController < ApplicationController
  before_action :set_obj, only: [:show, :edit, :update, :destroy, :ajax]

  # GET /objs
  # GET /objs.json
  def index
    @objs = Obj.all
  end

  # GET /objs/1
  # GET /objs/1.json
  def show
  end

  # GET /objs/new
  def new
    @obj = Obj.new
  end

  def ajax

    @obj.update(updated_at:Time.zone.now)

  end
  # GET /objs/1/edit
  def edit
  end

  # POST /objs
  # POST /objs.json
  def create
    @obj = Obj.new(obj_params)

    respond_to do |format|
      if @obj.save
        format.html { redirect_to @obj, notice: 'Obj was successfully created.' }
        format.json { render :show, status: :created, location: @obj }
      else
        format.html { render :new }
        format.json { render json: @obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objs/1
  # PATCH/PUT /objs/1.json
  def update
    respond_to do |format|
      if @obj.update(obj_params)
        format.html { redirect_to @obj, notice: 'Obj was successfully updated.' }
        format.json { render :show, status: :ok, location: @obj }
      else
        format.html { render :edit }
        format.json { render json: @obj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objs/1
  # DELETE /objs/1.json
  def destroy
    @obj.destroy
    respond_to do |format|
      format.html { redirect_to objs_url, notice: 'Obj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obj
      @obj = Obj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obj_params
      params.require(:obj).permit(:name, :desc)
    end
end
