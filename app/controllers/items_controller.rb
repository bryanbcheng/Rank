class ItemsController < ApplicationController
  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # POST /items
  # POST /items.xml
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(params[:item])
    #@item = Item.new(params[:item])
    
    if @item.save
      flash[:notice] = 'Task created successfully.'
      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = 'Error with saving item.'
    end
  end

  def upvote
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.up_votes = @item.up_votes + 1;
    @item.save

    respond_to do |format|
      format.js
    end
  end

  def downvote
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.down_votes = @item.down_votes + 1;
    @item.save

    respond_to do |format|
      format.js
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
