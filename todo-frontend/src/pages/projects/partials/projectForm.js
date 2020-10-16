import React from 'react'
import { TextField } from '@material-ui/core'

export default function ProjectForm() {
    return (
        <form>
            <TextField id="standard-basic" className="field" label="Nome"/>
        </form>
    );
}