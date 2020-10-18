import React from 'react';
import { BsEyeFill, BsFillTrashFill, BsPencilSquare, BsPlusCircleFill } from 'react-icons/bs'
import { Link } from 'react-router-dom'
import { Card } from '@material-ui/core'

import { getProjects, handleDestroyProject } from './partials/api'

export default function IndexProjects() {
  const projects = getProjects();
  return (
    <article>
      <header className="header">
        <Link to={'/project/new'}>
          <BsPlusCircleFill size={25} color="white"/>
        </Link>
      </header>
      { projects.map(project => (
          <Card className="cards" key={`${project.id}`}>
            <h3>{project.name}</h3>
            <hr />
            <div className='links'>
            <Link to={`project/${project.id}/show`}>
                <BsEyeFill size={25}/>
            </Link>
            <BsFillTrashFill onClick={() => handleDestroyProject()} size={25} />
            <Link to={`/project/${project.id}/edit`} className="edit">
              < BsPencilSquare size={25}/>
            </Link>
          </div>
          </Card>
      ))}
    </article>
  );
}