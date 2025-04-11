class RoutesController < ApplicationController
  # Ensure the user is authenticated before accessing any routes actions
  before_action :authenticate_user!
  # Use a callback to set the route for actions that require a specific route record
  before_action :set_route, only: %i[ show edit update destroy ]

  # GET /routes
  # Show only the routes that belong to the current user
  def index
    @routes = current_user.routes
  end

  # GET /routes/1
  def show
  end

  # GET /routes/new
  # Create a new route associated with the current user
  def new
    @route = current_user.routes.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  # Create a new route from the permitted parameters, automatically associating it with current_user
  def create
    @route = current_user.routes.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: "Route was successfully created." }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: "Route was successfully updated." }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_path, notice: "Route was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Callback to set the route based on the current user
    def set_route
      @route = current_user.routes.find(params[:id])
    end

    # Only allow a trusted list of parameters through.
    # Removed the user_id from permitted params as it will be set from current_user
    def route_params
      params.require(:route).permit(:origin, :destination, :distance, :duration)
    end
end
