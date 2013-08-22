require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BackgroundInformationsController do

  # This should return the minimal set of attributes required to create a valid
  # BackgroundInformation. As you add validations to BackgroundInformation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "elevator_pitch" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BackgroundInformationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all background_informations as @background_informations" do
      background_information = BackgroundInformation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:background_informations).should eq([background_information])
    end
  end

  describe "GET show" do
    it "assigns the requested background_information as @background_information" do
      background_information = BackgroundInformation.create! valid_attributes
      get :show, {:id => background_information.to_param}, valid_session
      assigns(:background_information).should eq(background_information)
    end
  end

  describe "GET new" do
    it "assigns a new background_information as @background_information" do
      get :new, {}, valid_session
      assigns(:background_information).should be_a_new(BackgroundInformation)
    end
  end

  describe "GET edit" do
    it "assigns the requested background_information as @background_information" do
      background_information = BackgroundInformation.create! valid_attributes
      get :edit, {:id => background_information.to_param}, valid_session
      assigns(:background_information).should eq(background_information)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BackgroundInformation" do
        expect {
          post :create, {:background_information => valid_attributes}, valid_session
        }.to change(BackgroundInformation, :count).by(1)
      end

      it "assigns a newly created background_information as @background_information" do
        post :create, {:background_information => valid_attributes}, valid_session
        assigns(:background_information).should be_a(BackgroundInformation)
        assigns(:background_information).should be_persisted
      end

      it "redirects to the created background_information" do
        post :create, {:background_information => valid_attributes}, valid_session
        response.should redirect_to(BackgroundInformation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved background_information as @background_information" do
        # Trigger the behavior that occurs when invalid params are submitted
        BackgroundInformation.any_instance.stub(:save).and_return(false)
        post :create, {:background_information => { "elevator_pitch" => "invalid value" }}, valid_session
        assigns(:background_information).should be_a_new(BackgroundInformation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BackgroundInformation.any_instance.stub(:save).and_return(false)
        post :create, {:background_information => { "elevator_pitch" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested background_information" do
        background_information = BackgroundInformation.create! valid_attributes
        # Assuming there are no other background_informations in the database, this
        # specifies that the BackgroundInformation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BackgroundInformation.any_instance.should_receive(:update).with({ "elevator_pitch" => "MyText" })
        put :update, {:id => background_information.to_param, :background_information => { "elevator_pitch" => "MyText" }}, valid_session
      end

      it "assigns the requested background_information as @background_information" do
        background_information = BackgroundInformation.create! valid_attributes
        put :update, {:id => background_information.to_param, :background_information => valid_attributes}, valid_session
        assigns(:background_information).should eq(background_information)
      end

      it "redirects to the background_information" do
        background_information = BackgroundInformation.create! valid_attributes
        put :update, {:id => background_information.to_param, :background_information => valid_attributes}, valid_session
        response.should redirect_to(background_information)
      end
    end

    describe "with invalid params" do
      it "assigns the background_information as @background_information" do
        background_information = BackgroundInformation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BackgroundInformation.any_instance.stub(:save).and_return(false)
        put :update, {:id => background_information.to_param, :background_information => { "elevator_pitch" => "invalid value" }}, valid_session
        assigns(:background_information).should eq(background_information)
      end

      it "re-renders the 'edit' template" do
        background_information = BackgroundInformation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BackgroundInformation.any_instance.stub(:save).and_return(false)
        put :update, {:id => background_information.to_param, :background_information => { "elevator_pitch" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested background_information" do
      background_information = BackgroundInformation.create! valid_attributes
      expect {
        delete :destroy, {:id => background_information.to_param}, valid_session
      }.to change(BackgroundInformation, :count).by(-1)
    end

    it "redirects to the background_informations list" do
      background_information = BackgroundInformation.create! valid_attributes
      delete :destroy, {:id => background_information.to_param}, valid_session
      response.should redirect_to(background_informations_url)
    end
  end

end
