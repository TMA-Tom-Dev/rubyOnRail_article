class QuotesController < ApplicationController
  before_action :set_quote, only: [:showQuote, :updateQuote, :deleteQuote]

  def listQuotes
    @quotes = Quote.all
  end

  def newQuote
    @quote = Quote.new
  end

  def createQuote
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to list_path, notice: "Quote was successfully created."
    else
      render :newQuote
    end
  end

  def showQuote

  end

  def updateQuote
    if @quote.update(quote_params)
      redirect_to list_path, notice: "Quote was successfully updated."
    else
      render :showQuote
    end
  end

  def deleteQuote
    @quote.destroy
    redirect_to list_path, notice: "Quote was successfully destroyed."
  end

  private
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end

end
