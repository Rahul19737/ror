class VisitorsController < ApplicationController
  before_action :set_visitor, only: %i[show edit update destroy]
  before_action :authenticate_guest!, except: %i[index new create show]

  # GET /visitors or /visitors.json
  def index
    @visitors = Visitor.all
  end

  # GET /visitors/1 or /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
    if @visitor.guest != current_guest
      redirect_to @visitor, notice: "Not Authorized"
    end
  end

  # POST /visitors or /visitors.json
  def create
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: "Visitor was successfully created." }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1 or /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to @visitor, notice: "Visitor was successfully updated." }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1 or /visitors/1.json
  def destroy
    if @visitor.guest == current_guest
      @visitor.destroy
      respond_to do |format|
        format.html { redirect_to visitors_url, notice: "Visitor was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to @visitor, notice: "Not Authorized"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitor_params
      params.require(:visitor).permit(:checked_in, :name, :phone_number, :guest_id, :reason_of_visit)
    end
end
