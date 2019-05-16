class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
	def index
		@portfolios = Portfolio.all
		@page_title = "Dustin's Portfolio"
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio.save
				format.html { redirect_to portfolios_path, notice: "Your portfolio has been created." }
			else
				format.html { render :new }
			end
		end
	end

	def show
		@page_title = @portfolio.title
		@seo_keywords = @portfolio.body
	end

	def edit
	end

	def update
		respond_to do |format|
			if @portfolio.update(portfolio_params)
				format.html { redirect_to portfolios_path, notice: "Your portfolio has been updated." }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@portfolio.destroy

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
                                      :thumb_image
                                      )
  end

  def set_portfolio_item
    @portfolio = Portfolio.find(params[:id])
  end
end