class GigsController < ApplicationController

def index
  @gigs = Gig.all.order("created_at DESC").page(params[:page]).per(15)
end

def new
  @gig = Gig.new
end

def create
  @gig = current_user.gigs.new(gig_params)
  if @gig.save
    redirect_to @gig, notice: "Job created"
  else
    render :new
  end
end

def show
  @gig = Gig.find(params[:id])
end

private

def gig_params
  params.require(:gig).permit(:name, :description, :budget, :location, :open)
end

end