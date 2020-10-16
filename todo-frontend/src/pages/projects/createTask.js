import { Card } from '@material-ui/core';
import React from 'react'
import TaskForm from './partials/taskForm';

export default function CreateTask() {
  return (
    <Card>
      <TaskForm />
    </Card>
  );
}