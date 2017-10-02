class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    # @contacts = Contact.all
    @friends = Friend.all
    @emergencies = Emergency.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @path = set_edit_path
  end

  # GET /contacts/new
  def new
    @contact = Contact.new(set_type)
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    byebug
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      case params[:type]
      when "Friend"
        @contact = Friend.find(params[:id])
      when "Emergency"
        @contact = Emergency.find(params[:id])
      end
    end

    def set_type
      case params[:type]
      when "Friend"
        { type: "Friend" }
      when "Emergency"
        { type: "Emergency" }
      end
    end

    def set_edit_path
      case params[:type]
      when "Friend"
        edit_friend_path(@contact)
      when "Emergency"
        edit_emergency_path(@contact)
      end
    end

    def get_type
      set_type[:type].downcase.to_sym
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require( get_type ).permit(:type, :first_name, :last_name, :email, :mobile, :address, :city, :state, :country)
    end
end
