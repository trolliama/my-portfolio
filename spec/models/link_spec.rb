require 'rails_helper'

RSpec.describe Link, type: :model do

    context "Invalid Object" do
        

        context "Required Fields" do
            before(:all) do
                @link = Link.new
            end
    
            after(:all) do
                @link.destroy
            end

            it "should be invalid" do
                expect(@link).to_not be_valid
            end

            it "required to belong to a link_type" do
                expect(@link.errors[:link_type]).to include("must exist")
            end

            it "required to have a link" do
                expect(@link.errors[:link]).to include("can't be blank")
            end

            it "required to have a name" do
                expect(@link.errors[:name]).to include("can't be blank")
            end

            it "required to have tooltip" do
                expect(@link.errors[:tooltip]).to include("can't be blank")
            end
        end

        context "Unique Fields" do
            before(:all) do
                @link_type = LinkType.create!(type_name: "Link Type", icon: "fa-link")
                @created_link = Link.create!(link_type: LinkType.first, link: "http://www.google.com", name: "Google", tooltip: "Google")
                @link = Link.new(link_type: LinkType.first, link: "http://www.google.com", name: "Google", tooltip: "Google")
            end

            after(:all) do
                @created_link.destroy
                @link_type.destroy
            end

            it "should be invalid" do
                expect(@link).to_not be_valid
            end

            it "link must be unique" do
                expect(@link.errors[:link]).to include("has already been taken")
            end

            it "name must be unique" do
                expect(@link.errors[:name]).to include("has already been taken")
            end
        end
    end

    context "Valid Object" do
        before(:example) do
            @link_type = LinkType.create!(type_name: "Link Type", icon: "fa-link")
            @link = Link.create!(link_type: @link_type, link: "http://www.google.com", name: "Google", tooltip: "Google")
        end
        
        it "should be valid" do
            expect(@link).to be_valid
        end
    end
end