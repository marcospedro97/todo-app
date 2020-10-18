import React from 'react'
import { TextField, Button } from '@material-ui/core'

export default function ProjectForm(props) {
    return (
        <form>
            <TextField id="standard-basic" className="field" label="Nome"/>
            <Button variant="contained" className="field" onClick={props.onSubmit}>Submit</Button>
        </form>
    );
}