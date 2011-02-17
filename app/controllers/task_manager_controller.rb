class TaskManagerController < ApplicationController
  def index
    @people = Person.includes( :tasks ).where( :active => true )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html { render :action => 'show' }
      format.xml { render :xml => @person }
    end
  end

  # DELETE /task_manager/1
  # DELETE /task_manager/1.xml
  def destroy
    @task = Task.find(params[:id])
    task_update = {}
    task_update[:active] = false;
    @task.update_attributes(task_update)
    
    respond_to do |format|
      format.html { redirect_to :back, :flash => { :notice => 'usunieto' } }
      format.xml  { head :ok }
    end
  end

  # PUT /task_manager/1/finish
  # PUT /task_manager/1/finish.xml
  def finish
    @task = Task.find(params[:id])
    task_update = {}
    task_update[:date_finish] = Time.now

    respond_to do |format|
      if @task.update_attributes(task_update)
        format.html { redirect_to :back, :flash => { :notice => 'zadanie przeniesione do archiwum' } }
        format.xml  { head :ok }
      else
        format.html #
        format.xml  #
      end
    end
  end 

  # GET /task_manager/1/archive
  # GET /task_manager/1.xml
  def archive
    @tasks = Task.where( "person_id == ? AND date_finish != ''" , params[:id])

    respond_to do |format|
      format.html # archive.html.erb
      format.xml { render :xml => @tasks }
    end
  end
end
