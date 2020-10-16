import React from 'react'
import { TextField } from '@material-ui/core'

export default function TaskForm() {
    return (
        <form>
            <TextField id="standard-basic" className="field" label="Nome"/>
            <TextField id="standard-basic" className="field" label="Descrição"/>
        </form>
    );
}