class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  layout 'discussion'

  def index
    if has_role?(:admin)
      @channels = Channel.all
      @discussions = Discussion.all.order("created_at DESC")
    else
      redirect_to discussions_path, notice: "You are not authorized to view this page."
    end
  end

  def show
    @discussions = Discussion.where(channel_id: @channel.id).page(params[:page]).per(4).order("created_at DESC")
    @channels = Channel.all
  end

  def new
    if has_role?(:admin)
      @channel = Channel.new
    else
      redirect_to discussions_path, notice: "You are not authorized to perform this action."
    end
  end

  def edit
    if has_role?(:admin)
      @channel = Channel.find(params[:id])
    else
      redirect_to @channel, notice: "You are not authorized to perform this action."
    end
  end

  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to channels_path, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to channels_path, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_channel
      @channel = Channel.find(params[:id])
    end

    def channel_params
      params.require(:channel).permit(:channel)
    end
end
