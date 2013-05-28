require 'spec_helper'

describe Admin::BreadcrumbHelper do
  it "returns an ordered hash" do
    url = '/admin/projects/55/media_items' 
    @project = create(:project, id: 55)
    crumbs = Breadcrumb.generate_crumbs_from_url(url)
    crumbs.class.should == Array
    crumbs.first.class.should == Breadcrumb
  end

  it "has no hidden text elements" do
    PermanentPage.seed
    home_id = PermanentPage.find_by_name(:homepage_slideshow)
    url = "/admin/permanent_pages/#{home_id}/media_items"
    crumbs = Breadcrumb.generate_crumbs_from_url(url)
    Breadcrumb::HIDDEN_TEXT_ELEMENTS.each do |hidden|
      crumbs.each do |crumb|
        crumb.text.should_not == hidden
      end
    end
  end

  it "overrides first element of output array" do
    array = [1,2,3]
    new_array = Breadcrumb.override_first(array)
    crumb = new_array[0]
    crumb.should be_a Breadcrumb
    crumb.text.should == Breadcrumb::FIRST_OVERRIDE_TEXT
    crumb.url.should == Breadcrumb::FIRST_OVERRIDE_URL
  end

end
