class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :find_channels, only: [:index, :show, :new, :edit]
  layout 'discussion'

  def index
    @discussions = Discussion.page(params[:page]).per(4).order("created_at DESC")
  end

  def show
    @discussions = Discussion.all.order("created_at DESC")
  end

  def new
    @discussion = current_user.discussions.build
  end

  def edit
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    def discussion_params
      params.require(:discussion).permit(:title, :content, :channel_id)
    end

    def find_channels
      @channels = Channel.all
    end
end
