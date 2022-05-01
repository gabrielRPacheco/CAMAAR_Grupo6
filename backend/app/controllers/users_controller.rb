##classe da controler do cadastro de usuarios
class UsersController < ApplicationController
  respond_to :json
  private
  def respond_with(resource)
    register_success(resource) && return if resource != nil

    register_failed(resource)
  end
  def register_success(resource)
    render json: {
      message: 'Cadastrado com sucesso',
      user: resource
    }, status: :ok
  end
  def register_failed(resource)
    render json: {
      message: 'Error ao cadastrar usuario',
      user: resource
    }, status: :unauthorized
  end
  public
  def create
      email = params[:email_pessoa]
      senha = User.new(:password => params[:senha_pessoa]).encrypted_password
      if Member.exists?(:email=> email) && !User.exists?(:email=> email)
            member = Member.find_by(:email => email)
            user = User.create(email: email,encrypted_password: senha, created_at: params[:created_at_pessoa], updated_at: params[:updated_at_pessoa], member: member)
      end
      respond_with(user)
  end
  end
