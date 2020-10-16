import React from 'react';
import { BsFillTrashFill, BsPencilSquare } from 'react-icons/bs'
import { Card } from '@material-ui/core';
import { Link } from 'react-router-dom';

import { getTasks, handleDestroyTask } from './partials/api'

export default function ShowProject() {
  const tasksList = getTasks();
  return (
      <article>
        { tasksList.map(task => (
          <Card variant="outlined" className="cards">
            <strong>{task.name}</strong>
            <hr />
            <p>{task.description}</p>
            <div class='links'>
            <BsFillTrashFill onClick={() => handleDestroyTask()} size={25} />
            <Link to={`/project/${task.project.id}/task/${task.id}/edit`} className="edit">
              < BsPencilSquare size={25}/>
            </Link>
            </div>
          </Card>
        )) }
      </article>
  );
}