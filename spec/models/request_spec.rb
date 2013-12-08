require 'spec_helper'

describe Request do
    let(:user) { User.create(name: 'martin') }
    let(:request) { Request.create(title: 'need help', description: 'very good pay') }

  it "relationships" do
    expect(user.requests.first.id).to == request.id
  end
  
  it "is valid from the Fabric" do
    pending "WIP"
    expect(@request).to be_valid
  end

  describe "Queries" do

    context "Find Requests sent to group or expert, but has not received any quotes" do
      it "pending_quotes" do
        @user.pending_quotes.first.should eq @request
      end
    end

    context "Find Requests that has received price quotes" do
      before do
        @price_quote = Fabricate(:price_quote, request: @request)
      end

      it "requests_with_price_quotes" do
        @dont_find_me = Fabricate(:request, user: @user)
        expect(@user.requests_with_price_quotes.first).to eq @request
      end

      it "the other selectors should not find anything here" do
        expect(@user.pending_quotes.first).to_not be(@request)
        expect(@user.requests_with_accepted_quotes.first).to_not be(@request)
      end
    end

    context "Find Requests that we have ACCEPTED a price quote on " do
      before do
        @price_quote = Fabricate(:price_quote, request: @request)
        @price_quote.status = 'accepted'
        @price_quote.save
      end

      it "requests_with_accepted_quotes" do
        @dont_find_me = Fabricate(:request, user: @user, status: :rejected)
        expect(@user.requests_with_accepted_quotes).to include(@request)
      end

      context "the other selectors should not find anything here" do
        it "pending_quotes" do
          expect(@user.pending_quotes).to_not include(@request)
        end

        it "requests_with_price_quotes" do
          expect(@user.requests_with_price_quotes).to_not include(@request)
        end
      end
    end

  end
end
