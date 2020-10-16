require 'rails_helper'

describe 'Task' do
  context 'create' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      params = { name: 'lavar louça', description: 'faça rápido' }
      # ACT
      post project_task_index_path(project.id), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(201)
      expect(json[:name]).to eq(params[:name])
      expect(json[:description]).to eq(params[:description])
    end

    it 'failed' do
      # ARRANGE
      project = create(:project)
      params = { description: 'faça rápido' }
      # ACT
      post project_task_index_path(project.id), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(400)
      expect(json[:error]).to eq('Invalid Record')
    end
  end

  context 'index' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      tasks = create_list(:task, 5, project_id: project.id)
      # ACT
      get project_task_index_path(project.id)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(200)
      expect(json.length).to eq(tasks.length)
      expect(response.body).to eq(tasks.to_json)
    end

    it 'failed' do
      # ACT
      get project_task_index_path(123)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(404)
      expect(json[:error]).to eq('Record Not Found')
    end
  end

  context 'update' do
    it 'successfully' do
      # ARRANGE
      project = create(:project)
      task = create(:task, project_id: project.id)
      params = { name: 'name' }
      # ACT
      put project_task_path(project_id: project.id, id: task.id), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(202)
      expect(json[:name]).to eq(params[:name])
      expect(json[:description]).to eq(task.description)
    end

    it 'failed' do
      # ARRANGE
      project = create(:project)
      task = create(:task, project_id: project.id)
      params = { name: nil }
      # ACT
      put project_task_path(project_id: project.id, id: task.id), params: params
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(400)
      expect(json[:error]).to eq('Invalid Params')
    end
  end

  context 'destroy' do
    it 'successfully' do
      # ARRANGE
      task = create(:task)
      # ACT
      delete project_task_path(project_id: task.project_id, id: task.id)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(202)
    end

    it 'failed' do
      # ARRANGE
      project = create(:project)
      # ACT
      delete project_task_path(project_id: project.id, id: 123)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(404)
      expect(json[:error]).to eq('Record Not Found')
    end
  end

  context 'show' do
    it 'successfully' do
      # ARRANGE
      task = create(:task)
      # ACT
      get project_task_path(project_id: task.project.id, id: task.id)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(200)
      expect(json[:name]).to eq(task.name)
      expect(json[:created_at]).not_to be_nil
      expect(json[:updated_at]).not_to be_nil
    end

    it 'failed' do
      # ACT
      get project_task_path(project_id: 123, id: 1)
      json = JSON.parse(response.body, symbolize_names: true)
      # ASSERT
      expect(response.status).to eq(404)
      expect(json[:error]).to eq('Record Not Found')
    end
  end
end