class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]	
	layout "portfolio"
	
	def index
		@portfolio_items = Portfolio.all
		@page_title = "Dustin's Portfolio"
	end

	def angular
		@angular_portfolio_items = Portfolio.angular
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: "Your portfolio has been created." }
			else
				format.html { render :new }
			end
		end
	end

	def show
		@page_title = @portfolio_item.title
		@seo_keywords = @portfolio_item.body
		@portfolio_items = Portfolio.all
	end

	def edit
	end

	def update
		respond_to do |format|
			if @portfolio_item.update(portfolio_params)
				format.html { redirect_to portfolios_path, notice: "Your portfolio item has been updated." }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@portfolio_item.destroy

		respond_to do |format|
			format.html { redirect_to portfolios_path, notice: "Record was deleted." }
		end
	end

	private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:name]
                                      )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end