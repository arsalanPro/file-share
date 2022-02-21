require 'securerandom'
class DocumentsController < ApplicationController
  def index
    if current_user != nil
      @documents = Document.where(:user_id =>  current_user.id).order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @document = Document.new(create_document_params);
    # @document.user_id = current_user.id;
    @document.save;
    redirect_to '/'
  end

  def show
    @document = Document.find_by!(key: params[:id], shared: true)
  end

  def update
    @checked = (params[:document] && (params[:document][:shared] == '1')) ? true : false
    @document = Document.find_by!(key: params[:id])
    @document && @document.update(shared: @checked) 
    redirect_to '/'
  end

  def destroy
    @document = Document.find_by!(key: params[:id])
    @document.user_document.purge_later
    @document.destroy
  end

  private
  def create_document_params
    params.require(:document).permit(:user_document).merge(key: "#{SecureRandom.hex(6)}#{Time.now.to_i}")
  end
end
