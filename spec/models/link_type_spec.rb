require 'rails_helper'

RSpec.describe LinkType, type: :model do

    context "Invalid Object" do
        before(:context) do
            @link_type = LinkType.new
        end

        after(:context) do
            @link_type.destroy
        end

        context "Required Validation Error" do
            it "type_name required" do
                expect(@link_type).to_not be_valid
                expect(@link_type.errors[:type_name]).to include("can't be blank")
            end
            
            it "icon required" do
                expect(@link_type).to_not be_valid
                expect(@link_type.errors[:icon]).to include("can't be blank")
            end
        
        end

        context "Unique Validation Error" do
            before(:all) do
                @created_link_type = LinkType.create!(type_name: "Test", icon: "test")
            end

            after(:all) do
                @created_link_type.destroy
            end

            it "type_name should be unique" do

                @link_type.type_name = "Test"
                
                expect(@link_type).to_not be_valid
                expect(@link_type.errors[:type_name]).to include("has already been taken")
            end

            it "icon should be unique" do
                @link_type.icon = "test"
                
                expect(@link_type).to_not be_valid
                expect(@link_type.errors[:icon]).to include("has already been taken")
            end 
        end
    end

    context "Valid Object" do
        let(:link_type) { LinkType.new(type_name: "Unique type_name", icon: "Unique icon") }

        it "should be valid" do
            expect(link_type).to be_valid
        end
    end
end