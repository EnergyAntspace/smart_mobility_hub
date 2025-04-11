class FeedbacksController < ApplicationController
  # Ensure user is authenticated before accessing feedback actions
  before_action :authenticate_user!
  # Set the feedback using current_user's feedbacks for actions that require a specific feedback record
  before_action :set_feedback, only: %i[ show edit update destroy ]

  # GET /feedbacks or /feedbacks.json
  def index
    # Show only the feedbacks that belong to the current user
    @feedbacks = current_user.feedbacks
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    # Build a new feedback record for the current user
    @feedback = current_user.feedbacks.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks or /feedbacks.json
  def create
    # Create a new feedback associated with the current user
    @feedback = current_user.feedbacks.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_path, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Set the feedback record for the current user
    def set_feedback
      @feedback = current_user.feedbacks.find(params[:id])
    end

    # Only allow trusted parameters. Note: :user_id is omitted because it's set from current_user.
    def feedback_params
      params.require(:feedback).permit(:content, :rating)
    end
end
