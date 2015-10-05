class WikisController < ApplicationController
  before_action :set_record, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def index
    @wikis = current_user.wikis.order("created_at DESC")
  end
 
  def show
    # Render the show view
  end
  
  def create
    @wiki = current_user.wikis.build(wiki_params)
    
    if @wiki.save
      flash[:notice] = "saved"
      redirect_to wikis_path
    else
      flash[:error] = @wiki.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def edit
    # Render the edit view
  end
  
  def update
    # @item = Item.find(params[:id]) - not necessary because of before_action to set item
     @wiki.assign_attributes(wiki_params)
     if @wiki.save
       flash[:notice] = "Wiki was updated."
      redirect_to wikis_path 
     else
       flash[:error] = @wiki.errors.full_messages.to_sentence
       render :edit
     end
  end
  
  def new
    @wiki = Wiki.new
  end

  def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
  end
  
  private
  
  def set_record
    begin
      @wiki = current_user.wikis.find(params[:id]) 
    rescue 
      @wiki = nil
    end
  end
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
