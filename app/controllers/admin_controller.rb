class AdminController < ApplicationController

def home
    if session[:id].present?
        redirect_to :action => 'admin_home'
    else
        
    end
end


def admin_home
    if session[:id].present?

    else
        redirect_to :action => 'home'
    end
end

def destroy_session
    #puts(session[:id])
    reset_session
    #puts(session[:id])
    redirect_to :action => 'home'
end


def admin_check1
    @username=params[:username]
    @password=params[:password]
    @result=Admin.where(username: @username, password: @password)
    if @result.present?
        session[:id] = @result[0].id
    end
    respond_to do |format|
        format.html
        format.json {render :json => @result}
    end
end

def admin_direct1
	@id=params[:id]
	@result=Admin.where(id: @id)
	respond_to do |format|
        format.html
        format.json {render :json => @result}
    end
end

end
