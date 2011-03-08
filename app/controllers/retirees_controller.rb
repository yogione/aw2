require 'application_constant'
class RetireesController < ApplicationController
  
  # GET /retirees
  # GET /retirees.xml
  def index
   # @retirees = Retiree.all
    @retirees = Retiree.paginate(:page => params[:page], :per_page => ApplicationConstant::PER_PAGE,
                                 :order => 'created_at DESC')
     @retirees_sample = Retiree.all( :order => 'created_at DESC', :limit => 4)
    @title = "Retiree wisdom"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @retirees }
    end
  end

  def find_retiree
    @retirees = Retiree.paginate(:conditions => ["first_name LIKE ? OR last_name like ? OR years_worked = ?", params[:retiree][:name],params[:retiree][:name],params[:retiree][:name]], :page => params[:page], :per_page => ApplicationConstant::PER_PAGE,
                                 :order => 'created_at DESC')
    @title = "Found #{@retirees.size.to_s} results "

    respond_to do |format|
      format.html {render :action => :index}
      format.xml  { render :xml => @retirees }
    end
  end

  # GET /retirees/1
  # GET /retirees/1.xml
  def show
    @retiree = Retiree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retiree }
    end
  end

  # GET /retirees/new
  # GET /retirees/new.xml
  def new
    @retiree = Retiree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retiree }
    end
  end

  # GET /retirees/1/edit
  def edit
    @retiree = Retiree.find(params[:id])
  end

  # POST /retirees
  # POST /retirees.xml
  def create
    p params

    @retiree = Retiree.new(params[:retiree])
    @retiree.user_id = current_user.id
    respond_to do |format|
      if @retiree.save
         flash[:notice] =  'Retiree was successfully created.'
        format.html { redirect_to(:action=>"show", :controller=>"retirees", :id=>@retiree.id) }
        format.xml  { render :xml => @retiree, :status => :created, :location => @retiree }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retiree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retirees/1
  # PUT /retirees/1.xml
  def update
    @retiree = Retiree.find(params[:id])

    respond_to do |format|
      if @retiree.update_attributes(params[:retiree])
        format.html { redirect_to(@retiree, :notice => 'Retiree was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retiree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retirees/1
  # DELETE /retirees/1.xml
  def destroy
    @retiree = Retiree.find(params[:id])
    @retiree.destroy

    respond_to do |format|
      format.html { redirect_to(retirees_url) }
      format.xml  { head :ok }
    end
  end
end
