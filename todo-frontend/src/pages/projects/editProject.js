import React from 'react'
import { Card } from '@material-ui/core';

import { handleSubmitUpdateProject } from './partials/api'
import ProjectForm from './partials/projectForm'

export default function EditProject() {
  return (
    <Card>
      <ProjectForm onSubmit={handleSubmitUpdateProject}/>
  </Card>
  );
}