class Authentication::SessionsController < ApplicationController
    
    def new
    end

    def create
       
        @user = User.find_by("email = :login OR username = :login", {login: params[:login]})
        
        if @user&.authenticate(params[:password])
            redirect_to '/articles', notice: 'Inicio sesión Correctamente'
        else    
            redirect_to new_session_path, alert: 'Datos incorrectos'
        end

        #@user = User.new(user_params)
        #if @user.save
         #   redirect_to '/articles', notice: 'Usuario se ha creado correctamente'
        #else
         #   render :new, status: :unprocessable_entity
        #end
    end





    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end




end