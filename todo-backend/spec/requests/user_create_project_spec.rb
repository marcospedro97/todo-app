require 'rails_helper'

describe 'Project' do
  context 'create' do
    it 'successfully' do
      # ARRANGE
      params = { name: 'Some Cool Project name' }
      # ACT
      post project_index_path, params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(201)
      expect(json[:id]).not_to be(nil)
    end

    it 'should validate name' do
      # ARRANGE
      params = {}
      # ACT
      post project_index_path, params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).not_to be(:bad_request)
      expect(json[:error]).to eq('Invalid Record')
    end
  end

  context 'index' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      # ACT
      get project_index_path
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(200)
      expect(json[0][:name]).to eq(project.name)
      expect(json[0][:id]).not_to be_nil
    end
  end

  context 'show' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      # ACT
      get project_path(project.id)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(200)
      expect(json[:name]).to eq(project.name)
      expect(json[:created_at]).not_to be_nil
      expect(json[:updated_at]).not_to be_nil
    end

    it 'invalid id' do
      # ACT
      get project_path(1234)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to be(404)
      expect(json[:error]).to eq('Record Not Found')
    end
  end

  context 'update' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      params = { name: 'Some new cool name' }
      # ACT
      put project_path(project.id), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(json[:name]).to eq(params[:name])
      expect(response.status).to be(202)
    end

    it 'invalid name' do
      # ARRANGE
      project = create(:project)
      params = { name: nil }
      # ACT
      put project_path(project.id), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(json[:error]).to eq('Invalid Params')
      expect(response.status).to be(400)
    end

    it 'invalid id' do
      # ARRANGE
      params = { name: 'some name' }
      # ACT
      put project_path(123), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(json[:error]).to eq('Record Not Found')
      expect(response.status).to eq(404)
    end
  end

  context 'delete' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      # ACT
      delete project_path(project.id)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(json[:status]).to eq('Deleted with success')
      expect(response.status).to eq(202)
    end

    it 'failed' do
      # ACT
      delete project_path(123)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(json[:error]).to eq('Record Not Found')
      expect(response.status).to eq(404)
    end
  end
end
