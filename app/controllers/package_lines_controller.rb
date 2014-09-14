class PackageLinesController < ApplicationController
  before_action :set_package_line, only: [:show, :edit, :update, :destroy]

  # GET /package_lines
  # GET /package_lines.json
  def index
    @package_lines = PackageLine.all
  end

  # GET /package_lines/1
  # GET /package_lines/1.json
  def show
  end

  # GET /package_lines/new
  def new
    @package_line = PackageLine.new
  end

  # GET /package_lines/1/edit
  def edit
  end

  # POST /package_lines
  # POST /package_lines.json
  def create
    @package_line = PackageLine.new(package_line_params)

    respond_to do |format|
      if @package_line.save
        format.html { redirect_to @package_line, notice: 'Package line was successfully created.' }
        format.json { render :show, status: :created, location: @package_line }
      else
        format.html { render :new }
        format.json { render json: @package_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_lines/1
  # PATCH/PUT /package_lines/1.json
  def update
    respond_to do |format|
      if @package_line.update(package_line_params)
        format.html { redirect_to @package_line, notice: 'Package line was successfully updated.' }
        format.json { render :show, status: :ok, location: @package_line }
      else
        format.html { render :edit }
        format.json { render json: @package_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_lines/1
  # DELETE /package_lines/1.json
  def destroy
    @package_line.destroy
    respond_to do |format|
      format.html { redirect_to package_lines_url, notice: 'Package line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_line
      @package_line = PackageLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_line_params
      params.require(:package_line).permit(:package_id, :listing_id, :time)
    end
end
