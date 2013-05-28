require 'spec_helper'

describe Breadcrumb do
  let(:crumb) {Breadcrumb.new}
  it 'can set a url' do
    crumb.url.should be_nil
    crumb.url = 'something'
    crumb.url.should == 'something'
  end

  it 'can set text' do
    crumb.text.should be_nil
    crumb.text = 'really long'
    crumb.text.should == 'really long'
  end

  it 'has a linkable method' do
    crumb.linkable.should be_false
    crumb.url = 'something'
    crumb.linkable.should be_true
  end

  it 'can be created with a hash' do
    new_crumb = Breadcrumb.new_from_hash(text: 'slither', url: 'slather')
    new_crumb.class.should == Breadcrumb
    new_crumb.url.should == 'slather'
    new_crumb.text.should == 'slither'
  end

  it 'has a joiner' do
    Breadcrumb.new.joiner.should_not be_blank
  end

end

