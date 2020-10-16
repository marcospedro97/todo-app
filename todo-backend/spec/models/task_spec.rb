require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should be valid' do
    project = create(:project)
    expect(Task.new({ name: 'some name', description: 'idk', project_id: project.id })).to be_valid
  end

  it 'should validate project presence' do
    expect(Task.new({ name: 'name', description: 'idk'})).not_to be_valid
  end

  it 'should validate name presence' do
    project = create(:project)
    expect(Task.new({ description: 'idk', project_id: project.id })).not_to be_valid
  end

  it 'should validate description presence' do
    project = create(:project)
    expect(Task.new({ name: 'some name', project_id: project.id })).not_to be_valid
  end
end
