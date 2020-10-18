import { Container } from '@material-ui/core';
import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import './App.sass'
import CreateProject from './pages/projects/createProject'
import CreateTask from './pages/projects/createTask'
import EditProject from './pages/projects/editProject'
import EditTask from './pages/projects/editTask'
import IndexProjects from './pages/projects/index'
import ShowProject from './pages/projects/show';

function App() {
  return (
    <Container maxWidth='sm' className="main">
        <Router className="root">
          <Switch>
           <Route path='/' exact render={() => <IndexProjects />} />
            <Route path='/project/:id/show' exact render={() => <ShowProject />}/>
            <Route path='/project/:id/edit' exact render={() => <EditProject />}/>
            <Route path='/project/:id/task/:task_id/edit' exact render={() => <EditTask />}/>
            <Route path='/project/new' exact render={() => <CreateProject />}/>
            <Route path='/project/:id/task/new' exact render={() => <CreateTask />}/>
          </Switch>
        </Router>
    </Container>
  );
}

export default App;
