import React from 'react'
import { Card } from '@material-ui/core';

import { handleSubmitCreateProject } from './partials/api'
import ProjectForm from './partials/projectForm'

export default function CreateProject() {
  return (
    <Card>
      <ProjectForm onSubmit={ handleSubmitCreateProject }/>
    </Card>
  );
}