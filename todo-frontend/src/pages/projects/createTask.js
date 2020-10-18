import { Card } from '@material-ui/core';
import React from 'react'
import TaskForm from './partials/taskForm';
import { handleSubmitCreateTask } from './partials/api'


export default function CreateTask() {
  return (
    <Card>
      <TaskForm onSubmit={ handleSubmitCreateTask }/>
    </Card>
  );
}