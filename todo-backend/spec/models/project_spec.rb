require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'should be valid with name' do
    expect(Project.new({ name: 'some name' })).to be_valid
  end

  it 'should not be valid without name' do
    expect(Project.new).not_to be_valid
  end
end
