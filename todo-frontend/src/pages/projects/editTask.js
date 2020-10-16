import React from 'react'
import TaskForm from './partials/taskForm';
import { Card } from '@material-ui/core'

export default function EditTask() {
  return (
    <Card>
      <TaskForm />
    </Card>
  );
}