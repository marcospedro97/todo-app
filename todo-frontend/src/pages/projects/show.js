import React from 'react';
import { BsFillTrashFill, BsPencilSquare, BsPlusCircleFill } from 'react-icons/bs'
import { Card } from '@material-ui/core';
import { Link } from 'react-router-dom';

import { getTasks, handleDestroyTask } from './partials/api'

export default function ShowProject() {
  const tasksList = getTasks();
  return (
      <article>
        <header className="header">
          <Link to={`/project/${tasksList[0].project.id}/task/new`}>
            <BsPlusCircleFill size={25} color="white"/>
          </Link>
        </header>
        { tasksList.map(task => (
          <Card variant="outlined" className="cards" key={`${task.id}`}>
            <strong>{task.name}</strong>
            <hr />
            <p>{task.description}</p>
            <div className='links'>
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