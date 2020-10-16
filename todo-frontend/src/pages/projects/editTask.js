import React from 'react'
import TaskForm from './partials/taskForm';
import { Card } from '@material-ui/core'
import { handleSubmitUpdateTask } from './partials/api'

export default function EditTask() {
  return (
    <Card>
      <TaskForm onSubmit={ handleSubmitUpdateTask }/>
    </Card>
  );
}