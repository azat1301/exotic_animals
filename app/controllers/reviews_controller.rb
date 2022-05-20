class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @animal = Animal.find(params[:animal_id])
    @review.animal = @animal
    authorize @review

    if @review.save
      redirect_to animal_path(@animal), notice: 'Review was successfully created.'
    else
      @booking = Booking.new
      render "animals/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
